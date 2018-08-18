ntp:
  pkg:
    - installed
  service:
    - name: ntpd
    - running
    - enable: True
    - require:
      - pkg: ntp

/etc/ntp.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://ntp/files/ntp.conf
    - restart: ntp
