{% extends '//mix/template/proxy.sh' %}

{% block bld_libs %}
lib/archive/mix.sh
{% endblock %}

{% block install %}
cd ${out} && cp -R $(dirname $(command -v bsdtar)) ./
{% endblock %}
