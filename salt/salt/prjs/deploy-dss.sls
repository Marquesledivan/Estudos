{% set prj = 1 %}
{% for prj in range(1,6) %}
/u01/dss/prj0{{ prj }}:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

dss{{ prj }}:
  file.recurse:
    - name: /u01/dss/prj0{{ prj }}
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti_prj0{{ prj }}/dss
    - include_empty: True
{% endfor %}
