#!/usr/bin/env bash

set -e
set -x

if [ "$(uname)" == "Darwin" ]; then
  # See https://conda-forge.org/docs/maintainer/knowledge_base.html#newer-c-features-with-old-sdk
  CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
fi

meson setup \
  --prefix ${PREFIX} \
  --libdir ${PREFIX}/lib \
  --buildtype=release \
  c_glib.build c_glib

meson compile -C c_glib.build
meson install -C c_glib.build
