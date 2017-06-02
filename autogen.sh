#! /bin/sh

LT="libtool"

OS=$(uname)

if [[ $OS == *"Darwin"* ]]; then
	LT="glibtoolize --copy"
else
	LT="libtool"
fi

echo "running aclocal..." && aclocal && \
echo "running "$LT"..." && $LT && \
echo "running autoheader..." && autoheader && \
echo "running automake..." && automake --add-missing && \
echo "running autoreconf..." && autoreconf --force --install && \
echo "running configure script..." && ./configure "$@"