#! /bin/bash

cd /app
wget http://www.mpich.org/static/downloads/3.3.2/mpich-3.3.2.tar.gz
tar -xzf mpich-3.3.2.tar.gz
cd mpich-3.3.2
./configure --prefix=/app/mpiccInstall --enable-fast=03 --enable-shared --enable-romio --enable-threads --disable-fortran --disable-fc
make -j8
make install

cd /etc/ld.so.conf.d
touch mpicc.conf
echo “/app/mpiccInstall/include” >> mpicc.conf
ldconfig
export PATH=/app/mpiccInstall/bin:$PATH

cd /app
