/etc/docker/certs.d/end_point:5000:
  file.directory:
    - user: root
    - group: root
    - mod: 0644
    - makedirs: True

/etc/docker/certs.d/end_point:5000/ca.crt:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://docker/files/ca.crt

login-registry:
  cmd.run:
    - name: docker login -u ledivan -p senha -e ledivanbernardo@cvc.com.br end_point:5000
    - watch:
      - file: /etc/docker/certs.d/end_point:5000/ca.crt
