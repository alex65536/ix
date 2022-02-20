{% extends '//mix/make.sh' %}

{% block fetch %}
https://downloads.sourceforge.net/project/p7zip/p7zip/16.02/p7zip_16.02_src_all.tar.bz2
a0128d661cfe7cc8c121e73519c54fbf
{% endblock %}

{% block bld_libs %}
lib/c
lib/c++
{% endblock %}

{% block setup %}
export CXXFLAGS="-std=c++03 ${CXXFLAGS}"
{% endblock %}

{% block make_flags %}
-f makefile
DEST_DIR=${out}
{% endblock %}

{% block make_target %}
7za
{% endblock %}

{% block install %}
{{super()}}
mv ${out}/usr/local/* ${out}/
rm -r ${out}/usr
{% endblock %}
