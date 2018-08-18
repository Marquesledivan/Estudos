sshd:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://sshd/files/sshd_config.jinja
    - template: jinja
{% if grains.id in salt['pillar.get']('master:nodegroups:middleware', []) %}
    - context:
      allowed_groups : admins middleware oracle jenkins
{% elif grains.id in salt['pillar.get']('master:nodegroups:telecom', []) %}
    - context:
      allowed_groups : admins telecom
{% elif grains.id in salt['pillar.get']('master:nodegroups:job', []) %}
    - context:
      allowed_groups : admins job
{% elif grains.id in salt['pillar.get']('master:nodegroups:vault', []) %}
    - context:
      allowed_groups : admins vault
{% elif grains.id in salt['pillar.get']('master:nodegroups:n1', []) %}
    - context:
      allowed_groups : admins n1
{% elif grains.id in salt['pillar.get']('master:nodegroups:alm', []) %}
    - context:
      allowed_groups : admins alm jenkins
{% elif grains.id in salt['pillar.get']('master:nodegroups:dbas', []) %}
    - context:
      allowed_groups : admins dbas
{% else %}
    - context:
      allowed_groups : admins
{% endif %}
