epel:
    cmd:
        - run
        {% if grains['osrelease'].startswith('5') %}
        - name: rpm -Uvh http://download.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm
        {% elif grains['osrelease'].startswith('6') %}
        - name: rpm -Uvh http://download.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm
        {% elif grains['osrelease'].startswith('7') %}
        - name: rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
        {% endif %}
        - unless: test -e /etc/yum.repos.d/epel.repo

common.packages:
  pkg.installed:
    - pkgs:
      - vim-enhanced
      - tcpdump
      - telnet
      - wget
      - zip
      - unzip
      - openssh-clients
      - authconfig
      - gcc
      - make
      - perl
      - python
      - bc
      - dmidecode
      - logwatch
      - sysstat
      - ntsysv
      - bind-utils
      - xorg-x11-xinit
      - xorg-x11-xauth
      - xorg-x11-utils
      - MySQL-python
      - xinetd
      - python-devel
      - lm_sensors
      - net-tools
      - htop
      - lsof
