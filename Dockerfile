FROM cmbant/docker-gcc-prereq:latest

MAINTAINER Antony Lewis

RUN git clone git://gcc.gnu.org/git/gcc.git --branch vehre/head_cosmo --single-branch \
 && cd gcc \
 && mkdir objdir \
 && cd objdir \
 && ../configure --enable-languages=c,c++,fortran --disable-multilib \
    --disable-bootstrap --enable-checking=release --libdir=/usr/lib/x86_64-linux-gnu \
 && make -j"$(nproc)" \
 && sudo make install \
 && make distclean
