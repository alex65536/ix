{% extends '//bin/kernel/19/t/ix.sh' %}

{% block slot %}0{% endblock %}

{% block kernel_flags %}
{% include 'cfg' %}
{% endblock %}

{% block firmware %}
{% endblock %}

{% block bld_tool %}
bin/tar
{{super()}}
{% endblock %}
