{% set prj = 1 %}
{% for prj in range(1,6) %}
/u01/pphands/ti_prj0{{ prj }}/cvc_home:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/u01/pphands/ti_prj0{{ prj }}/farm:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/u01/pphands/ti_prj0{{ prj }}/config:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

pphands_cvc_home_prj0{{ prj }}:
  file.recurse:
    - name: /u01/pphands/ti_prj0{{ prj }}/cvc_home
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti_prj0{{ prj }}/pphands/cvc_home
    - include_empty: True

pphands_farm_prj0{{ prj }}:
  file.recurse:
    - name: /u01/pphands/ti_prj0{{ prj }}/farm
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti_prj0{{ prj }}/pphands/farm
    - include_empty: True

pphands_config_prj{{ prj }}:
  file.recurse:
    - name: /u01/pphands/ti_prj0{{ prj }}/config
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti_prj0{{ prj }}/pphands/config
    - include_empty: True

{% endfor %}
