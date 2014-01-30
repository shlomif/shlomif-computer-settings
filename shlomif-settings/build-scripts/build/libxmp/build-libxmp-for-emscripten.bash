# SOURCE ME.
jslib="libxmp.js"
mod_dir="mods"
mod="yonqatan.mod"
path_to_mod="$HOME/Music/mp3s/Mods"

if ! test -e "$mod_dir/$mod" ; then
    mkdir -p "$mod_dir"
    cp "$path_to_mod/$mod" "$mod_dir/"
fi

autoconf && \
emconfigure ./configure && \
perl -i.bak -ple 's/\A(\$\(SRC_OBJS\)\s*=)/${1} js_wrappers.o /' src/Makefile && \
perl -i.bak -ple 's/\ALOBJS\s*=.*/LOBJS = \$(OBJS)/' Makefile && \

TAB=$'\t'
cat <<EOF >> Makefile && \

${jslib}: \$(OBJS)
${TAB}emcc --jcache -s TOTAL_MEMORY="$((128 * 1024 * 1024 ))" -s EXPORTED_FUNCTIONS="['fopen','fwrite','fclose','xmp_create_context','xmp_load_module','xmp_start_player','xmp_play_frame','xmp_get_frame_info','xmp_end_player','xmp_release_module','xmp_free_context','xmp_js__mi_get_loop_count','xmp_js__mi_get_buffer','xmp_js__mi_get_buffer_size']" --embed-file "$mod_dir/$mod" -O2 \$(OBJS) -o \$@

EOF
emmake make -j4 "${jslib}"

