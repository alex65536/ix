{% extends '//mix/template/cmake.sh' %}

{% block fetch %}
https://github.com/ninja-build/ninja/archive/refs/tags/v1.10.2.tar.gz
639f75bc2e3b19ab893eaf2c810d4eb4
{% endblock %}

{% block bld_deps %}
lib/c++/mix.sh
dev/build/python/mix.sh
{{super()}}
{% endblock %}
