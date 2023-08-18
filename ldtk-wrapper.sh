#!/bin/bash

declare -a FLAGS=(\
	--enable-gpu-rasterization --enable-zero-copy --enable-gpu-compositing \
	--enable-native-gpu-memory-buffers --enable-oop-rasterization --disable-gpu-blocklist \
	--enable-features=WaylandWindowDecorations --ozone-platform-hint=auto \
)

if [[ -e "$XDG_RUNTIME_DIR/${WAYLAND_SOCKET}" ]] && [[ -c /dev/nvidia0 ]]; then
	FLAGS+=(--disable-gpu-sandbox)
fi
	
exec zypak-wrapper /app/ldtk/ldtk "${FLAGS[@]}" "$@"
