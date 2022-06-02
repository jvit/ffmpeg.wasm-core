#!/bin/bash

set -euo pipefail
source $(dirname $0)/var.sh

FLAGS=(
  "${FFMPEG_CONFIG_FLAGS_BASE[@]}"
    --disable-everything
    --disable-autodetect
    --disable-network
    --enable-small
    --enable-decoder=pcm_f32le
    --enable-demuxer=pcm_f32le
    --enable-muxer=wav,pcm_*,flac,mp4,mp3,opus,ogg
    --enable-encoder=pcm_*,flac,aac,libmp3lame,libopus,libvorbis
    --enable-protocol=file
    --enable-libmp3lame
    --enable-libopus
    --enable-libvorbis
    --enable-filter=aresample
)
echo "FFMPEG_CONFIG_FLAGS=${FLAGS[@]}"
emconfigure ./configure "${FLAGS[@]}"
