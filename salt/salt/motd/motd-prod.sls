/etc/motd: 
  file.managed: 
    - user: root 
    - group: root 
    - mode: 0644 
    - source: salt://motd/files/motd-prod.template 
    - template: jinja
