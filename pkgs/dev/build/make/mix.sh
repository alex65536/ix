{% extends '//mix/template/autohell.sh' %}

{% block fetch %}
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
fc7a67ea86ace13195b0bce683fd4469
{% endblock %}

{% block bld_libs %}
lib/intl/mix.sh
lib/iconv/mix.sh
{% endblock %}

{% block std_env %}
env/std/0/mix.sh
{% endblock %}

{% block setup %}
export CPPFLAGS="-I./glob ${CPPFLAGS}"

{% if target.os == 'darwin' %}
export CPPFLAGS="-Dglob=make_glob -Dglobfree=make_globfree -Dfnmatch=make_fnmatch ${CPPFLAGS}"
{% endif %}
{% endblock %}

{% block configure_flags %}
--disable-load
{% endblock %}
