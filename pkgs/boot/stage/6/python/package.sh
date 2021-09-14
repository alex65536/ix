# url https://www.python.org/ftp/python/3.9.5/Python-3.9.5.tar.xz
# md5 71f7ada6bec9cdbf4538adc326120cfd
# bld {{'boot/lib/linux' | linux}} boot/lib/z boot/lib/compiler_rt boot/stage/5/env

build() {
    $untar ${src}/Python* && cd Python*

    setup_compiler

    sed -e 's/MULTIARCH=\$.*/MULTIARCH=/' -i ./configure

    sed -e 's|/usr|/eat/shit|' -i ./configure
    sed -e 's|/usr|/eat/shit|' -i ./setup.py
    sed -e 's|/usr|/eat/shit|' -i ./Makefile.pre.in

    dash ./configure ${COFLAGS} \
        --prefix=${out} \
        --with-ensurepip=no

    make -j ${make_thrs} 2>log

    base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

    mv Modules/Setup qw && (cat qw | ./python ./fix.py | sed -e 's|-l.*||' | grep -v readline | grep -v capi | grep -v nis) > Modules/Setup

    make -j ${make_thrs}
    make install

    $out/bin/python3 -c 'import zlib'
}
