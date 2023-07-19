#! /bin/sh
#
# Copyright (C) 2023, HENSOLDT Cyber GmbH
#

DIR="build/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  cmake -Bbuild -H.
fi

cmake --build build -j8
export GZ_PARTITION=relay
./build/gazebo_proxy $@

