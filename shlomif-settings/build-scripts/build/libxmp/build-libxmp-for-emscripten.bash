# SOURCE ME.
jslib="libxmp.js"
autoconf && \
emconfigure ./configure && \
perl -i.bak -ple 's/\ALOBJS\s*=.*/LOBJS = \$(OBJS)/' Makefile && \
cat <<EOF >> Makefile && \

${jslib}: \$(OBJS)
	emcc -O2 \$(OBJS) -o \$@

EOF
emmake make -j4 "${jslib}"
