SET( H_FILES
   "CommandListener.h"
   "FrameListener.h"
   "NatNet.h"
   "NatNetPacket.h"
   "NatNetSender.h"
)

INSTALL(
   FILES ${H_FILES}
   DESTINATION include/NatNetLinux
)
