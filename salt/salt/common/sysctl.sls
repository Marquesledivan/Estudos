/opt/cvc:
  file.directory:
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

/opt/cvc/variables_kernel.sh:
  file.managed:
    - user: root
    - group: root
    - mode: 0764
    - source: salt://common/files/variables_kernel.sh


{% set shmmax = salt['cmd.shell']('[ -f /opt/cvc/variables_kernel.sh ] && /opt/cvc/variables_kernel.sh shmmax || echo 68719476736') %}
{% set shmall = salt['cmd.shell']('[ -f /opt/cvc/variables_kernel.sh ] && /opt/cvc/variables_kernel.sh shmall || echo 4294967296') %}
{% set max_orphan = salt['cmd.shell']('[ -f /opt/cvc/variables_kernel.sh ] && /opt/cvc/variables_kernel.sh max_orphan || echo 262144') %}
{% set file_max = salt['cmd.shell']('[ -f /opt/cvc/variables_kernel.sh ] && /opt/cvc/variables_kernel.sh file_max || echo 65535') %}
{% set max_tw = salt['cmd.shell']('[ -f /opt/cvc/variables_kernel.sh ] && /opt/cvc/variables_kernel.sh max_tw || echo 1440000') %}
{% set min_free = salt['cmd.shell']('[ -f /opt/cvc/variables_kernel.sh ] && /opt/cvc/variables_kernel.sh min_free || echo 5572') %}

kernel.shmmax:
  sysctl.present:
    - value: {{ shmmax }}

kernel.shmall:
  sysctl.present:
    - value: {{ shmall }}

net.ipv4.tcp_max_orphans:
  sysctl.present:
    - value: {{ max_orphan }}

fs.file-max:
  sysctl.present:
    - value: {{ file_max }}

net.ipv4.tcp_max_tw_buckets:
  sysctl.present:
    - value: {{ max_tw }}

vm.min_free_kbytes:
  sysctl.present:
    - value: {{ min_free }}

net.ipv4.tcp_syncookies:
  sysctl.present:
    - value: 0

net.ipv4.tcp_keepalive_time:
  sysctl.present:
    - value: 600

net.ipv4.tcp_synack_retries:
  sysctl.present:
    - value: 3

net.ipv4.tcp_syn_retries:
  sysctl.present:
    - value: 3

net.ipv4.tcp_rfc1337:
  sysctl.present:
    - value: 1

net.ipv4.ip_local_port_range:
  sysctl.present:
    - value: 1024 65535

net.ipv4.conf.all.log_martians:
  sysctl.present:
    - value: 0

{% if grains['osrelease'].startswith('6') %}
net.ipv4.inet_peer_gc_mintime:
  sysctl.present:
    - value: 5
{% endif %}

net.ipv4.tcp_ecn:
  sysctl.present:
    - value: 0

net.ipv4.tcp_window_scaling:
  sysctl.present:
    - value: 1

net.ipv4.tcp_timestamps:
  sysctl.present:
    - value: 1

net.ipv4.tcp_sack:
  sysctl.present:
    - value: 0

net.ipv4.tcp_fack:
  sysctl.present:
    - value: 1

net.ipv4.tcp_dsack:
  sysctl.present:
    - value: 0

net.ipv4.conf.default.rp_filter:
  sysctl.present:
    - value: 0

net.ipv4.tcp_tw_recycle:
  sysctl.present:
    - value: 1

net.ipv4.tcp_max_syn_backlog:
  sysctl.present:
    - value: 20000

net.ipv4.tcp_orphan_retries:
  sysctl.present:
    - value: 1

net.ipv4.tcp_fin_timeout:
  sysctl.present:
    - value: 20

net.ipv4.tcp_no_metrics_save:
  sysctl.present:
    - value: 1

net.ipv4.tcp_moderate_rcvbuf:
  sysctl.present:
    - value: 1

net.ipv4.tcp_rmem:
  sysctl.present:
    - value: 4096 87380 16777216

net.ipv4.tcp_wmem:
  sysctl.present:
    - value: 4096 87380 16777216

net.core.rmem_max:
  sysctl.present:
    - value: 36777216

net.core.wmem_max:
  sysctl.present:
    - value: 36777216

net.core.netdev_max_backlog:
  sysctl.present:
    - value: 2500

net.core.somaxconn:
  sysctl.present:
    - value: 65000

vm.swappiness:
  sysctl.present:
    - value: 0

fs.suid_dumpable:
  sysctl.present:
    - value: 0

kernel.printk:
  sysctl.present:
    - value: 4 4 1 7

kernel.core_uses_pid:
  sysctl.present:
    - value: 1

kernel.sysrq:
  sysctl.present:
    - value: 0

kernel.msgmax:
  sysctl.present:
    - value: 65536

kernel.msgmnb:
  sysctl.present:
    - value: 65536
