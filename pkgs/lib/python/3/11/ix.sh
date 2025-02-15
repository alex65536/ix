{% extends '//lib/python/3/10/ix.sh' %}

{% block fetch %}
https://github.com/python/cpython/archive/refs/tags/v3.11.0.tar.gz
sha:c580bc1dd1f0f5142cdceb9d47fb8a50934b36447f636a37507b8f1e466b4bf3
{% endblock %}

{% block lib_deps %}
lib/c
lib/gdbm
{{super()}}
{% endblock %}

{% block bld_tool %}
bld/python
{{super()}}
{% endblock %}

{% block cpp_defines %}
{{super()}}
CONFIG_64=1
HAVE_NDBM_H=1
USE_NDBM=1
{% endblock %}

{% block setup %}
{{super()}}
export ax_cv_c_float_words_bigendian=no
{% endblock %}

{% block patch %}
{{super()}}

cd Modules/_ctypes

cat cfield.c \
    | grep -v 'ffi_type ffi_type_s' \
    | grep -v 'ffi_type ffi_type_u' \
    | grep -v 'ffi_type ffi_type_d' \
    | grep -v 'ffi_type ffi_type_f' \
    | grep -v 'ffi_type ffi_type_v' \
    | grep -v 'ffi_type ffi_type_p' \
    | grep -v 'ffi_type ffi_type_l' \
    | grep -v 'FFI_TYPE_LONGDOUBLE };' > _ && mv _ cfield.c
{% endblock %}

{% block ensure_static_build %}
base64 -d << EOF > fix.py
{% include 'fix.py/base64' %}
EOF

cat Modules/Setup \
    | python3 fix.py      \
    | grep -v capi        \
    | grep -v nis         \
    | grep -v spwd        \
    | grep -v pyexpat     \
    | grep -v _decimal    \
    | grep -v xxsubtype   \
    | grep -v ossaudiodev \
    | grep -v _uuidmodule \
    > _

cat Modules/Setup.stdlib.in \
    | grep _sql             \
    | sed -e 's|.*@||g'     \
    >> _

cat _ - << EOF > Modules/Setup.local
_decimal _decimal/_decimal.c
{% if darwin %}
_scproxy _scproxy.c
{% endif %}
pyexpat pyexpat.c
EOF
{% endblock %}

{% block test_bin %}
{{super()}}
${out}/bin/python3 -c 'import pyexpat; import dbm;'
{% endblock %}
