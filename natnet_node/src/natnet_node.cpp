#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>

#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>

#include <NatNetLinux/NatNet.h>
#include <NatNetLinux/CommandListener.h>
#include <NatNetLinux/FrameListener.h>

#include <boost/program_options.hpp>
#include <time.h>

#include <string>

#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <tf_conversions/tf_eigen.h>

#include <natnet_node/optitrack.h> //old version not really necessary
#include <natnet_node/rigid_bodies.h>
#include <natnet_node/unid_markers.h>

class Globals
{
public:

   // Parameters read from the command line
   static uint32_t localAddress;
   static uint32_t serverAddress;

   // State of the main() thread.
   static bool run;
};
uint32_t Globals::localAddress = 0;
uint32_t Globals::serverAddress = 0;
bool Globals::run = false;

namespace runtime_globals {
  ros::Publisher rigid_bodies_pub;
  ros::Publisher unid_markers_pub;
}
// End the program gracefully.
void terminate(int)
{
   // Tell the main() thread to close.
   Globals::run = false;
}

// Set the global addresses from the command line.
void readOpts( int argc, char* argv[] )
{
   namespace po = boost::program_options;

   po::options_description desc("simple-example: demonstrates using NatNetLinux\nOptions");
   desc.add_options()
      ("help", "Display help message")
      ("local-addr,l", po::value<std::string>(), "Local IPv4 address")
      ("server-addr,s", po::value<std::string>(), "Server IPv4 address")
   ;

   po::variables_map vm;
   po::store(po::parse_command_line(argc,argv,desc), vm);

   if(
      argc < 5 || vm.count("help") ||
      !vm.count("local-addr") ||
      !vm.count("server-addr")
   )
   {
      std::cout << desc << std::endl;
      exit(1);
   }

   Globals::localAddress = inet_addr( vm["local-addr"].as<std::string>().c_str() );
   Globals::serverAddress = inet_addr( vm["server-addr"].as<std::string>().c_str() );
}

// This thread loop just prints frames as they arrive.
void printFrames(FrameListener& frameListener)
{
   bool valid;
   MocapFrame frame;
   Globals::run = true;
   while(Globals::run)
   {
      while( true )
      {
         // Try to get a new frame from the listener.
         MocapFrame frame(frameListener.pop(&valid).first);
         // Quit if the listener has no more frames.
         if( !valid )
            break;
         std::cout << frame << std::endl;
      }

      // Sleep for a little while to simulate work :)
      usleep(1000);
   }
}

bool processFrame(MocapFrame &frame, natnet_node::unid_markers &unid_markers_msg, natnet_node::rigid_bodies &rigid_bodies_msg){
/*  frame.frameNum();
  frame.latency();
  frame.rigidBodies();
  frame.timecode();
  frame.unIdMarkers();
  frame.unpack();
  frame._frameNum;
  frame._labeledMarkers;
  frame._latency;
  frame._markerSet;
  frame._nnMajor;
  frame._nnMinor;
  frame._numMarkerSets;
  frame._numRigidBodies;
  frame._skel;
  frame._rBodies;
  frame._subTimecode;
  frame._timecode;
  frame._uidMarker;*/
  bool has_markers {false};
  unid_markers_msg.unid_markers.clear();
  rigid_bodies_msg.rigid_bodies.clear();
  rigid_bodies_msg.rigid_body_ids.clear();

  if (frame.unIdMarkers().size() > 0){//ball or another marker is present publish as Points
      for (Point3f unidmark : frame.unIdMarkers()){
         geometry_msgs::Point dest;
         dest.x = unidmark.x; dest.y = unidmark.y; dest.z = unidmark.z;
         unid_markers_msg.unid_markers.push_back(dest);
        }
      has_markers = true;
  }
  if (frame.rigidBodies().size() > 0){
      //std::cout << frame.rigidBodies().size() << std::endl;

      for (RigidBody rbody : frame.rigidBodies()){
        //std::cout << rbody.orientation().qw << std::endl;
        geometry_msgs::Pose pose;
        pose.orientation.w = rbody.orientation().qw;
        pose.orientation.x = rbody.orientation().qx;
        pose.orientation.y = rbody.orientation().qy;
        pose.orientation.z = rbody.orientation().qz;
        pose.position.x = rbody.location().x;
        pose.position.y = rbody.location().y;
        pose.position.z = rbody.location().z;
        rigid_bodies_msg.rigid_bodies.push_back(pose);
        std_msgs::Int64 id;
        id.data = rbody.id();
        rigid_bodies_msg.rigid_body_ids.push_back(id);
        //std::cout << id.data << std::endl;
        }
      has_markers = true;
    }
  //change this to account for latency
  unid_markers_msg.stamp = ros::Time::now();
  rigid_bodies_msg.stamp = unid_markers_msg.stamp;
  return has_markers;
}

// This thread loop publishes ros messages as the frames arrive.
void pubMsgFromFrame(FrameListener& frameListener)
{
   bool valid;
   MocapFrame frame;

   natnet_node::unid_markers unid_markers_msg;
   natnet_node::rigid_bodies rigid_bodies_msg;

   Globals::run = true;
   while(Globals::run)
   {
      while( true )
      {
         // Try to get a new frame from the listener.
         MocapFrame frame(frameListener.pop(&valid).first);
         // Quit if the listener has no more frames.
         if( !valid )
            break;
         if (processFrame(frame, unid_markers_msg, rigid_bodies_msg))
            runtime_globals::unid_markers_pub.publish(unid_markers_msg);
            runtime_globals::rigid_bodies_pub.publish(rigid_bodies_msg);
         //std::cout << frame << std::endl;
      }

      // Sleep for a little while to simulate work :)
      usleep(1000);
   }
}

// This thread loop collects inter-frame arrival statistics and prints a
// histogram at the end. You can plot the data by copying it to a file
// (say time.txt), and running gnuplot with the command:
//     gnuplot> plot 'time.txt' using 1:2 title 'Time Stats' with bars
void timeStats(FrameListener& frameListener, const float diffMin_ms = 0.5, const float diffMax_ms = 7.0, const int bins = 100)
{
   size_t hist[bins];
   float diff_ms;
   int bin;
   struct timespec current;
   struct timespec prev;
   struct timespec tmp;

   std::cout << std::endl << "Collecting inter-frame arrival statistics...press ctrl-c to finish." << std::endl;

   memset(hist, 0x00, sizeof(hist));
   bool valid;
   Globals::run = true;
   while(Globals::run)
   {
      while( true )
      {
         // Try to get a new frame from the listener.
         prev = current;
         tmp = frameListener.pop(&valid).second;
         // Quit if the listener has no more frames.
         if( !valid )
            break;

         current = tmp;

         diff_ms =
            std::abs(
               (static_cast<float>(current.tv_sec)-static_cast<float>(prev.tv_sec))*1000.f
                + (static_cast<float>(current.tv_nsec)-static_cast<float>(prev.tv_nsec))/1000000.f
            );

         bin = (diff_ms-diffMin_ms)/(diffMax_ms-diffMin_ms) * (bins+1);
         if( bin < 0 )
            bin = 0;
         else if( bin >= bins )
            bin = bins-1;

         hist[bin] += 1;
      }

      // Sleep for a little while to simulate work :)
      usleep(1000);
   }

   // Print the stats
   std::cout << std::endl << std::endl;
   std::cout << "# Time diff (ms), Count" << std::endl;
   for( bin = 0; bin < bins; ++bin )
      std::cout << diffMin_ms+(diffMax_ms-diffMin_ms)*(0.5f+bin)/bins << ", " << hist[bin] << std::endl;
}

int main(int argc, char* argv[])
{
   // Version number of the NatNet protocol, as reported by the server.
   unsigned char natNetMajor;
   unsigned char natNetMinor;

   // Sockets
   int sdCommand;
   int sdData;

   // Catch ctrl-c and terminate gracefully.
   signal(SIGINT, terminate);

   // Set addresses
   //-l 192.168.1.3 -s 192.168.1.2
   std::string local_addr{"192.168.1.3"};
   std::string server_addr{"192.168.1.2"};
   //readOpts( argc,  argv);

   Globals::localAddress = inet_addr( local_addr.c_str() );
   Globals::serverAddress = inet_addr( server_addr.c_str() );

   // Use this socket address to send commands to the server.
   struct sockaddr_in serverCommands = NatNet::createAddress(Globals::serverAddress, NatNet::commandPort);

   std::cout << "starting sockets..." << std::endl;
   // Create sockets
   sdCommand = NatNet::createCommandSocket( Globals::localAddress );
   sdData = NatNet::createDataSocket( Globals::localAddress );

   // Start the CommandListener in a new thread.
   CommandListener commandListener(sdCommand);
   commandListener.start();


   // Send a ping packet to the server so that it sends us the NatNet version
   // in its response to commandListener.
   NatNetPacket ping = NatNetPacket::pingPacket();
   ping.send(sdCommand, serverCommands);

   std::cout << "Getting NatNet Version..." << std::endl;
   // Wait here for ping response to give us the NatNet version.
   commandListener.getNatNetVersion(natNetMajor, natNetMinor);
   std::cout << "starting FrameListener..." << std::endl;

   // Start up a FrameListener in a new thread.
   FrameListener frameListener(sdData, natNetMajor, natNetMinor);
   frameListener.start();

   std::cout << "starting node..." << std::endl;

   ros::init(argc, argv, "natnet_node"); //initializa ROS Node
   ros::NodeHandle nh;

   std::cout << "starting topics..." << std::endl;

   runtime_globals::unid_markers_pub = nh.advertise<natnet_node::unid_markers> ("unid_markers", 1);
   runtime_globals::rigid_bodies_pub = nh.advertise<natnet_node::rigid_bodies> ("rigid_bodies", 1);

   // This infinite loop simulates a "worker" thread that reads the frame
   // buffer each time through, and exits when ctrl-c is pressed.

   //printFrames(frameListener);
   pubMsgFromFrame(frameListener);

   //timeStats(frameListener);

   // Wait for threads to finish.
   frameListener.stop();
   commandListener.stop();
   frameListener.join();
   commandListener.join();

   // Epilogue
   close(sdData);
   close(sdCommand);
   return 0;
}
