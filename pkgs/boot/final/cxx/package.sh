{% extends '//lib/cxx/package.sh' %}

{% block deps %}
# lib boot/stage/7/lib
# dep {{mix.if_linux('boot/lib/linux')}}
# dep boot/stage/6/cmake boot/stage/7/env
{% endblock %}
