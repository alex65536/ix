{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://github.com/void-linux/musl-fts/archive/refs/tags/v1.2.7.tar.gz
bce0b5de0cf2519a74fbfacead60369d
{% endblock %}

{% block bld_tool %}
dev/build/auto/conf/2/71
dev/build/auto/make/1/16
{% endblock %}

{% block autoreconf %}
sh bootstrap.sh
{% endblock %}

{% block lib_deps %}
lib/c
{% endblock %}
