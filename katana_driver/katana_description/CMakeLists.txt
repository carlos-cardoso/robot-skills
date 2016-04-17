cmake_minimum_required(VERSION 2.4.6)
include($ENV{ROS_ROOT}/core/rosbuild/rosbuild.cmake)

# Set the build type.  Options are:
#  Coverage       : w/ debug symbols, w/o optimization, w/ code-coverage
#  Debug          : w/ debug symbols, w/o optimization
#  Release        : w/o debug symbols, w/ optimization
#  RelWithDebInfo : w/ debug symbols, w/ optimization
#  MinSizeRel     : w/o debug symbols, w/ optimization, stripped binaries
#set(ROS_BUILD_TYPE RelWithDebInfo)

rosbuild_init()

#set the default path for built executables to the "bin" directory
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
#set the default path for built libraries to the "lib" directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

#uncomment if you have defined messages
#rosbuild_genmsg()
#uncomment if you have defined services
#rosbuild_gensrv()

#common commands for building c++ executables and libraries
#rosbuild_add_library(${PROJECT_NAME} src/example.cpp)
#target_link_libraries(${PROJECT_NAME} another_library)
#rosbuild_add_boost_directories()
#rosbuild_link_boost(${PROJECT_NAME} thread)
#rosbuild_add_executable(example examples/example.cpp)
#target_link_libraries(example ${PROJECT_NAME})

# iterate through all the stl files to:
#  1. convert to *.iv files
#  2. generate convex decomposed .stl
file(GLOB katana_stl_files ${CMAKE_CURRENT_SOURCE_DIR}/meshes/*/*.stl)
set(katana_gen_files "")

foreach(it ${katana_stl_files})
  get_filename_component(basepath ${it} PATH)
  get_filename_component(basename ${it} NAME_WE)

  IF ( ${basename} MATCHES "_convex" )

    message("ignoring stale .._convex.stl file:",${basename})

  ELSE ( ${basename} MATCHES "_convex" )

    # create subdirectory convex
    add_custom_command(
      OUTPUT ${basepath}/convex
      # CMake 2.4 doesn't offer the make_directory command.
      #COMMAND ${CMAKE_COMMAND} -E make_directory
      COMMAND mkdir -p
      ARGS ${basepath}/convex)

    #    # create subdirectory iv
    #    add_custom_command(
    #      OUTPUT ${basepath}/iv
    #      # CMake 2.4 doesn't offer the make_directory command.
    #      #COMMAND ${CMAKE_COMMAND} -E make_directory
    #      COMMAND mkdir -p
    #      ARGS ${basepath}/iv)
  
    # copy *.stl files to *.stlb so that ivcon recognizes them as binary stl files
    add_custom_command(
      OUTPUT ${it}b
      COMMAND ${CMAKE_COMMAND}
      ARGS -E copy_if_different ${it} ${it}b
      DEPENDS )

    set(katana_gen_files ${katana_gen_files} ${it}b)

    #create obj files for convex decomposition from stl files
    add_custom_command(
      OUTPUT ${basepath}/convex/${basename}.obj
      COMMAND ivcon
      ARGS ${it}b ${basepath}/convex/${basename}.obj
      DEPENDS ${it} ${it}b ${basepath}/convex)

    set(katana_gen_files ${katana_gen_files} ${basepath}/convex/${basename}.obj)

    #convex decompose object files
    add_custom_command(
      OUTPUT ${basepath}/convex/${basename}_convex.obj
      COMMAND convex_decomposition
      ARGS ${basepath}/convex/${basename}.obj -v12 -p10
      DEPENDS ${basepath}/convex/${basename}.obj ${basepath}/convex)

    set(katana_gen_files ${katana_gen_files} ${basepath}/convex/${basename}_convex.obj)

    #convert obj files back to stlb, put in directory named convex
    add_custom_command(
      OUTPUT ${basepath}/convex/${basename}_convex.stlb
      COMMAND ivcon
      ARGS ${basepath}/convex/${basename}_convex.obj ${basepath}/convex/${basename}_convex.stlb
      DEPENDS ${it} ${basepath}/convex ${basepath}/convex/${basename}_convex.obj)

    # copy *.stlb files to *.stl so that Gazebo doesn't complain about "Invalid mesh filename extension"
    add_custom_command(
      OUTPUT ${basepath}/convex/${basename}_convex.stl
      COMMAND ${CMAKE_COMMAND}
      ARGS -E copy_if_different ${basepath}/convex/${basename}_convex.stlb ${basepath}/convex/${basename}_convex.stl
      DEPENDS ${basepath}/convex/${basename}_convex.stlb)

    set(katana_gen_files ${katana_gen_files} ${basepath}/convex/${basename}_convex.stl)

    #    #convert obj files back to stla, put in directory named convex
    #    add_custom_command(
    #      OUTPUT ${basepath}/convex/${basename}_convex.stla
    #      COMMAND ivcon
    #      ARGS ${basepath}/convex/${basename}_convex.obj ${basepath}/convex/${basename}_convex.stla
    #      DEPENDS ${it} ${basepath}/convex ${basepath}/convex/${basename}_convex.obj)
    #
    #    set(katana_gen_files ${katana_gen_files} ${basepath}/convex/${basename}_convex.stla)

    #    #create iv files
    #    add_custom_command(
    #      OUTPUT ${basepath}/iv/${basename}.iv
    #      COMMAND ivcon
    #      ARGS ${it}b ${basepath}/iv/${basename}.iv
    #      DEPENDS ${basepath}/iv ${it} ${it}b)
    #    add_custom_command(
    #      OUTPUT ${basepath}/convex/${basename}_convex.iv
    #      COMMAND ivcon
    #      ARGS ${basepath}/convex/${basename}_convex.obj ${basepath}/convex/${basename}_convex.iv
    #      DEPENDS ${it} ${basepath}/convex ${basepath}/convex/${basename}_convex.obj)
     
    #    set(katana_gen_files ${katana_gen_files} ${basepath}/iv/${basename}.iv ${basepath}/convex/${basename}_convex.iv)


  ENDIF ( ${basename} MATCHES "_convex" )

endforeach(it)

add_custom_target(media_files ALL DEPENDS ${katana_gen_files} )

