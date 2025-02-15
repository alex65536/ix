{% extends '//die/c/wafbase.sh' %}

{% block fetch %}
https://download.samba.org/pub/samba/stable/samba-4.17.2.tar.gz
sha:e55ddf4d5178f8c84316abf53c5edd7b35399e3b7d86bcb81b75261c827bb3b8
{% endblock %}

{% block bld_libs %}
lib/c
lib/z
lib/aio
lib/cap
lib/tirpc
lib/uring
lib/gpgme
lib/gnutls
lib/jansson
lib/readline
lib/ini/parser
lib/bsd/overlay
lib/ucontext/posix
{% endblock %}

{% block waf %}${PWD}/buildtools/bin/waf{% endblock %}

{% block patch %}
sed -e 's|/tmp/|/var/tmp/|g' -i lib/replace/wscript
{% endblock %}

{% block setup %}
export PYTHONHASHSEED=1
{% endblock %}

{# need strange perl module #}

{% block bld_tool %}
bld/perl
bld/flex
bld/bison
{% endblock %}

{% block waf_flags %}
--disable-python
--without-ad-dc
--disable-fault-handling
{% endblock %}
