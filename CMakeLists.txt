#
# Copyright (C) 2023-2024, HENSOLDT Cyber GmbH
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# For commercial licensing, contact: info.cyber@hensoldt.net
#

cmake_minimum_required(VERSION 3.10.2 FATAL_ERROR)

project(gazebo_proxy)

# Find the Gazebo Transport library
find_package(gz-transport12 QUIET REQUIRED OPTIONAL_COMPONENTS log)
set(GZ_TRANSPORT_VER ${gz-transport12_VERSION_MAJOR})

if (EXISTS "${CMAKE_SOURCE_DIR}/msgs/")
  # Message generation. Only required when using custom Protobuf messages.
  find_package(Protobuf REQUIRED)
  add_subdirectory(msgs)
  set_source_files_properties(${PROTO_SRC} ${PROTO_HEADER} PROPERTIES GENERATED TRUE)
endif()

include_directories(${CMAKE_BINARY_DIR})

if (EXISTS "${CMAKE_SOURCE_DIR}/gazebo_proxy.cc")
	add_executable(gazebo_proxy gazebo_proxy.cc CmdOptions.cc CmdOptions.hh)
  target_link_libraries(gazebo_proxy gz-transport${GZ_TRANSPORT_VER}::core)
endif()

