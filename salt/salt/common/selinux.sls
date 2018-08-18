/etc/selinux/config:
  file.managed:
    - source: salt://common/files/selinux.conf

iptables:
  pkg.installed:
    - name: iptables
  service:
{% if grains.id in salt['pillar.get']('master:nodegroups:docker', []) %}
    - enable: True
    - running
{% else %}
    - dead
    - enable: False
{% endif %}

{% if grains['osrelease'] in ['6.0','6.1','6.2','6.3','6.4','6.5','6.6','6.7'] %}
iptables-ipv6:
  pkg.installed:
    - name: iptables-ipv6
  service:
{% if grains.id in salt['pillar.get']('master:nodegroups:docker', []) %}
    - enable: True
    - running
{% else %}
    - dead
    - enable: False
{% endif %}
{% elif grains['osrelease'] in ['7.0','7.1','7.2'] %}
iptables-services:
    pkg.installed:
      - name: iptables-services
    service:
{% if grains.id in salt['pillar.get']('master:nodegroups:docker', []) %}
    - enable: True
    - running
{% else %}
    - dead
    - enable: False
{% endif %}
{% endif %}
