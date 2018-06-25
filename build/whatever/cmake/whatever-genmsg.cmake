# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "whatever: 2 messages, 0 services")

set(MSG_I_FLAGS "-Iwhatever:/home/amvui/AMV/src/whatever/msg;-Imavros_msgs:/opt/ros/kinetic/share/mavros_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Igeographic_msgs:/opt/ros/kinetic/share/geographic_msgs/cmake/../msg;-Iuuid_msgs:/opt/ros/kinetic/share/uuid_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(whatever_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/node_master.msg" NAME_WE)
add_custom_target(_whatever_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "whatever" "/home/amvui/AMV/src/whatever/msg/node_master.msg" ""
)

get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/override_motor.msg" NAME_WE)
add_custom_target(_whatever_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "whatever" "/home/amvui/AMV/src/whatever/msg/override_motor.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(whatever
  "/home/amvui/AMV/src/whatever/msg/node_master.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whatever
)
_generate_msg_cpp(whatever
  "/home/amvui/AMV/src/whatever/msg/override_motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whatever
)

### Generating Services

### Generating Module File
_generate_module_cpp(whatever
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whatever
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(whatever_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(whatever_generate_messages whatever_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/node_master.msg" NAME_WE)
add_dependencies(whatever_generate_messages_cpp _whatever_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/override_motor.msg" NAME_WE)
add_dependencies(whatever_generate_messages_cpp _whatever_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whatever_gencpp)
add_dependencies(whatever_gencpp whatever_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whatever_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(whatever
  "/home/amvui/AMV/src/whatever/msg/node_master.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whatever
)
_generate_msg_eus(whatever
  "/home/amvui/AMV/src/whatever/msg/override_motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whatever
)

### Generating Services

### Generating Module File
_generate_module_eus(whatever
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whatever
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(whatever_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(whatever_generate_messages whatever_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/node_master.msg" NAME_WE)
add_dependencies(whatever_generate_messages_eus _whatever_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/override_motor.msg" NAME_WE)
add_dependencies(whatever_generate_messages_eus _whatever_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whatever_geneus)
add_dependencies(whatever_geneus whatever_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whatever_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(whatever
  "/home/amvui/AMV/src/whatever/msg/node_master.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whatever
)
_generate_msg_lisp(whatever
  "/home/amvui/AMV/src/whatever/msg/override_motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whatever
)

### Generating Services

### Generating Module File
_generate_module_lisp(whatever
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whatever
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(whatever_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(whatever_generate_messages whatever_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/node_master.msg" NAME_WE)
add_dependencies(whatever_generate_messages_lisp _whatever_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/override_motor.msg" NAME_WE)
add_dependencies(whatever_generate_messages_lisp _whatever_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whatever_genlisp)
add_dependencies(whatever_genlisp whatever_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whatever_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(whatever
  "/home/amvui/AMV/src/whatever/msg/node_master.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whatever
)
_generate_msg_nodejs(whatever
  "/home/amvui/AMV/src/whatever/msg/override_motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whatever
)

### Generating Services

### Generating Module File
_generate_module_nodejs(whatever
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whatever
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(whatever_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(whatever_generate_messages whatever_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/node_master.msg" NAME_WE)
add_dependencies(whatever_generate_messages_nodejs _whatever_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/override_motor.msg" NAME_WE)
add_dependencies(whatever_generate_messages_nodejs _whatever_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whatever_gennodejs)
add_dependencies(whatever_gennodejs whatever_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whatever_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(whatever
  "/home/amvui/AMV/src/whatever/msg/node_master.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whatever
)
_generate_msg_py(whatever
  "/home/amvui/AMV/src/whatever/msg/override_motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whatever
)

### Generating Services

### Generating Module File
_generate_module_py(whatever
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whatever
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(whatever_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(whatever_generate_messages whatever_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/node_master.msg" NAME_WE)
add_dependencies(whatever_generate_messages_py _whatever_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amvui/AMV/src/whatever/msg/override_motor.msg" NAME_WE)
add_dependencies(whatever_generate_messages_py _whatever_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(whatever_genpy)
add_dependencies(whatever_genpy whatever_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS whatever_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whatever)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/whatever
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET mavros_msgs_generate_messages_cpp)
  add_dependencies(whatever_generate_messages_cpp mavros_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(whatever_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(whatever_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whatever)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/whatever
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET mavros_msgs_generate_messages_eus)
  add_dependencies(whatever_generate_messages_eus mavros_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(whatever_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(whatever_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whatever)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/whatever
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET mavros_msgs_generate_messages_lisp)
  add_dependencies(whatever_generate_messages_lisp mavros_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(whatever_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(whatever_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whatever)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/whatever
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET mavros_msgs_generate_messages_nodejs)
  add_dependencies(whatever_generate_messages_nodejs mavros_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(whatever_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(whatever_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whatever)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whatever\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/whatever
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET mavros_msgs_generate_messages_py)
  add_dependencies(whatever_generate_messages_py mavros_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(whatever_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(whatever_generate_messages_py sensor_msgs_generate_messages_py)
endif()
