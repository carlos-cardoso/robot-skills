/* Auto-generated by genmsg_cpp for file /home/biorob/rosstacks/core_dev/core_communication_msgs/msg/Parameter.msg */
#ifndef CORE_COMMUNICATION_MSGS_MESSAGE_PARAMETER_H
#define CORE_COMMUNICATION_MSGS_MESSAGE_PARAMETER_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"


namespace core_communication_msgs
{
template <class ContainerAllocator>
struct Parameter_ {
  typedef Parameter_<ContainerAllocator> Type;

  Parameter_()
  : parameterId(0)
  , collectionId(0)
  , parameterDescription()
  , collectionDescription()
  , parentClass()
  , editable(false)
  , type()
  , value()
  {
  }

  Parameter_(const ContainerAllocator& _alloc)
  : parameterId(0)
  , collectionId(0)
  , parameterDescription(_alloc)
  , collectionDescription(_alloc)
  , parentClass(_alloc)
  , editable(false)
  , type(_alloc)
  , value(_alloc)
  {
  }

  typedef int32_t _parameterId_type;
  int32_t parameterId;

  typedef int32_t _collectionId_type;
  int32_t collectionId;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _parameterDescription_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  parameterDescription;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _collectionDescription_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  collectionDescription;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _parentClass_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  parentClass;

  typedef uint8_t _editable_type;
  uint8_t editable;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _type_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  type;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _value_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  value;


  typedef boost::shared_ptr< ::core_communication_msgs::Parameter_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::core_communication_msgs::Parameter_<ContainerAllocator>  const> ConstPtr;
  boost::shared_ptr<std::map<std::string, std::string> > __connection_header;
}; // struct Parameter
typedef  ::core_communication_msgs::Parameter_<std::allocator<void> > Parameter;

typedef boost::shared_ptr< ::core_communication_msgs::Parameter> ParameterPtr;
typedef boost::shared_ptr< ::core_communication_msgs::Parameter const> ParameterConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::core_communication_msgs::Parameter_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::core_communication_msgs::Parameter_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace core_communication_msgs

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::core_communication_msgs::Parameter_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::core_communication_msgs::Parameter_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::core_communication_msgs::Parameter_<ContainerAllocator> > {
  static const char* value() 
  {
    return "016b74fca8a90b8cadf93520158750d1";
  }

  static const char* value(const  ::core_communication_msgs::Parameter_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x016b74fca8a90b8cULL;
  static const uint64_t static_value2 = 0xadf93520158750d1ULL;
};

template<class ContainerAllocator>
struct DataType< ::core_communication_msgs::Parameter_<ContainerAllocator> > {
  static const char* value() 
  {
    return "core_communication_msgs/Parameter";
  }

  static const char* value(const  ::core_communication_msgs::Parameter_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::core_communication_msgs::Parameter_<ContainerAllocator> > {
  static const char* value() 
  {
    return "int32 parameterId\n\
int32 collectionId\n\
string parameterDescription\n\
string collectionDescription\n\
string parentClass\n\
bool editable\n\
string type\n\
string value\n\
\n\
";
  }

  static const char* value(const  ::core_communication_msgs::Parameter_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::core_communication_msgs::Parameter_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.parameterId);
    stream.next(m.collectionId);
    stream.next(m.parameterDescription);
    stream.next(m.collectionDescription);
    stream.next(m.parentClass);
    stream.next(m.editable);
    stream.next(m.type);
    stream.next(m.value);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct Parameter_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::core_communication_msgs::Parameter_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::core_communication_msgs::Parameter_<ContainerAllocator> & v) 
  {
    s << indent << "parameterId: ";
    Printer<int32_t>::stream(s, indent + "  ", v.parameterId);
    s << indent << "collectionId: ";
    Printer<int32_t>::stream(s, indent + "  ", v.collectionId);
    s << indent << "parameterDescription: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.parameterDescription);
    s << indent << "collectionDescription: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.collectionDescription);
    s << indent << "parentClass: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.parentClass);
    s << indent << "editable: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.editable);
    s << indent << "type: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.type);
    s << indent << "value: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.value);
  }
};


} // namespace message_operations
} // namespace ros

#endif // CORE_COMMUNICATION_MSGS_MESSAGE_PARAMETER_H

