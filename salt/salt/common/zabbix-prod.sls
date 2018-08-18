zabbix:
    cmd:
        - run
        {% if grains['osrelease'].startswith('5') %}
        - name: rpm -Uvh http://repo.zabbix.com/zabbix/2.4/rhel/5/x86_64/zabbix-release-2.4-1.el6.noarch.rpm
        {% elif grains['osrelease'].startswith('6') %}
        - name: rpm -Uvh http://repo.zabbix.com/zabbix/3.0/rhel/6/x86_64/zabbix-release-3.0-1.el6.noarch.rpm
        {% elif grains['osrelease'].startswith('7') %}
        - name: rpm -Uvh http://repo.zabbix.com/zabbix/3.0/rhel/7/x86_64/zabbix-release-3.0-1.el7.noarch.rpm
        {% endif %}
        - unless: test -e /etc/yum.repos.d/zabbix.repo

zabbix-agent:
  pkg.installed:
    - pkgs:
        - zabbix-agent

zabbix-agent-service:
  service:
    - name: zabbix-agent
    - running
    - enable: True
    - require:
      - pkg: zabbix-agent

/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://common/files/zabbix_agentd-prod.conf
    - template: jinja
    - restart: zabbix-agent
