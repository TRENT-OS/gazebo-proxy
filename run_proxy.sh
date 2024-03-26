#! /bin/sh
#
# Copyright (C) 2023-2024, HENSOLDT Cyber GmbH
#
# SPDX-License-Identifier: GPL-2.0-or-later
#
# For commercial licensing, contact: info.cyber@hensoldt.net
#

DIR="build/"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  cmake -Bbuild -H.
fi

cmake --build build -j8
export GZ_PARTITION=relay
./build/gazebo_proxy $@

