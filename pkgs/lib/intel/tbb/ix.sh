{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/oneapi-src/oneTBB/archive/refs/tags/v2021.4.0.tar.gz
md5:fa317f16003e31e33a57ae7d888403e4
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
{% if linux %}
lib/ucontext
{% endif %}
{% endblock %}

{% block bld_libs %}
{% if linux %}
lib/linux
lib/ucontext/posix
{% endif %}
{% endblock %}

{% block setup_tools %}
ln -s $(which llvm-install-name-tool) install_name_tool
{% endblock %}

{% block patch %}
sed -e 's|.*#pragma weak.*||' -i src/tbb/itt_notify.cpp
{% endblock %}

{% block cmake_flags %}
TBB_TEST=OFF
TBB_STRICT=OFF
TBBMALLOC_BUILD=OFF
{% endblock %}

{% block install %}
{{super()}}
sed -e 's|Threads::Threads|c|' -i ${out}/lib/cmake/TBB/TBBTargets.cmake
{% endblock %}
