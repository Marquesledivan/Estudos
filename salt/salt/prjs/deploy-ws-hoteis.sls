{% set Hostname = salt['grains.get']('fqdn') %}
{% set Env = salt['pillar.get'](Hostname ~ ':env') %}
{% set APP = "ws-hoteis" %}

{{ APP }}-{{ Env }}-cvc_home:
  file.directory:
    - name: /usr/local/cvc_home
    - user: oracle
    - group: oracle
    - mode: 0755
    - makedirs: True

{{ APP }}-{{ Env }}-upload:
  file.directory:
    - name: /u01/middleware/domains/corews_domain/servers/COREWS_admin/upload/
    - user: oracle
    - group: oracle
    - mode: 0755
    - makedirs: True

{{ APP }}-{{ Env }}-copy-cvc_home:
  file.recurse:
    - name: /usr/local/cvc_home
    - user: oracle
    - group: oracle
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti_{{ Env }}/{{ APP }}/cvc_home
    - include_empty: True

{{ APP }}-{{ Env }}-copy-upload:
  file.recurse:
    - name: /u01/middleware/domains/corews_domain/servers/COREWS_admin/upload/
    - user: oracle
    - group: oracle
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti_{{ Env }}/{{ APP }}/upload
    - include_empty: True
