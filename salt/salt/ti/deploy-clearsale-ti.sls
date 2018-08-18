/u01/clearsale/ti/cvc_home:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/u01/clearsale/ti/farm:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/u01/clearsale/ti/config:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

cvc_home:
  file.recurse:
    - name: /u01/clearsale/ti/cvc_home
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti/clearsale/cvc_home
    - include_empty: True

farm:
  file.recurse:
    - name: /u01/clearsale/ti/farm
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti/clearsale/farm
    - include_empty: True

config:
  file.recurse:
    - name: /u01/clearsale/ti/config
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://ti/clearsale/config
    - include_empty: True
