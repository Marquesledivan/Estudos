/opt/cvc/rpm:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

rpm_dataprotector:
  file.recurse:
    - name: /opt/cvc/rpm
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://common/files/rpm
    - include_empty: True

/etc/services:
  file.comment:
    - regex: ^personal-agent

xinetd:
  service:
    - running
    - full_restart: True
  watch:
    - file: /etc/xinetd.d/omni

{% if not salt['file.directory_exists' ]('/opt/omni') %}
install_dataprotector:
  cmd.run:
    - name: rpm -ivh /opt/cvc/rpm/OB2-*

restart_xinetd:
  cmd.run:
    - name: service xinetd restart
{% else %}
{% endif %}
