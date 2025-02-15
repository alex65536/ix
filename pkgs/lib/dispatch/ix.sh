{% extends '//die/c/cmake.sh' %}

{% block fetch %}
https://github.com/apple/swift-corelibs-libdispatch/archive/refs/tags/swift-5.7-RELEASE.tar.gz
sha:b8398571561f3e94053309c55029726af541180e3323ea68e3ca544bbdc57a10
{% endblock %}

{% block lib_deps %}
lib/c
lib/c++
lib/bsd
{% endblock %}

{% block bld_libs %}
lib/linux
lib/bsd/overlay
{% endblock %}

{% block build_flags %}
shut_up
{% endblock %}

{% block patch %}
cat << EOF >> os/generic_unix_base.h
#if !defined(skjhfsdhfjsdhgfk)
#define skjhfsdhfjsdhgfk

#if defined(__cplusplus)
    #define __BEGIN_DECLS extern "C" {
    #define __END_DECLS }
#else
    #define __BEGIN_DECLS
    #define __END_DECLS
#endif

#endif
EOF
{% endblock %}
