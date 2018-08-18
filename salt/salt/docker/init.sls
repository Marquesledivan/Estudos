/etc/yum.repos.d/docker.repo:
  file.managed:
    - user: root
    - group: root
    - mode: 0644
    - source: salt://docker/files/docker.repo

docker-install:
  pkg.installed:
    - pkgs:
        - docker-engine

docker-service:
  service:
    - name: docker
    - running
    - enable: True
    - require:
      - pkg: docker-install
