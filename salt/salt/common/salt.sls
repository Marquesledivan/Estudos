salt-minion:
  service:
    - running
    - enable: True
    - watch:
      - file: /etc/salt/minion.d/salt.conf
      - file: /etc/salt/minion.d/highstate.conf
      - file: /etc/salt/minion.d/securitypkgs.conf

/etc/salt/minion.d/salt.conf:
  file.managed:
    - source: salt://common/files/salt-minion.conf

/etc/salt/minion.d/highstate.conf:
  file.managed:
    - source: salt://common/files/highstate.conf

/etc/salt/minion.d/securitypkgs.conf:
  file.managed:
    - source: salt://common/files/securitypkgs.conf
