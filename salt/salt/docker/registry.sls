/etc/docker/certs.d/cvcregistry01.cvc.com.br:5000:
  file.directory:
    - user: root
    - group: root
    - mod: 0644
    - makedirs: True

/etc/docker/certs.d/cvcregistry01.cvc.com.br:5000/ca.crt:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://docker/files/ca.crt

login-registry:
  cmd.run:
    - name: docker login -u cvc -p cvc2016@@ -e redes@cvc.com.br cvcregistry01.cvc.com.br:5000
    - watch:
      - file: /etc/docker/certs.d/cvcregistry01.cvc.com.br:5000/ca.crt
