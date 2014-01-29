# SOURCE ME.
jslib="libxmp.js"
autoconf && \
emconfigure ./configure && \
perl -i.bak -ple 's/\ALOBJS\s*=.*/LOBJS = \$(OBJS)/' Makefile && \
TAB=$'\t'
cat <<EOF >> Makefile && \

${jslib}: \$(OBJS)
${TAB}emcc --jcache -s TOTAL_MEMORY="$((128 * 1024 * 1024 ))"-O2 \$(OBJS) -o \$@

EOF
emmake make -j4 "${jslib}"
