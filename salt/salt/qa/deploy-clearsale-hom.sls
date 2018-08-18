/u01/clearsale/hom/cvc_home:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/u01/clearsale/hom/farm:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

/u01/clearsale/hom/config:
  file.directory:
    - user: root
    - group: root
    - mode: 0755
    - makedirs: True

cvc_home:
  file.recurse:
    - name: /u01/clearsale/hom/cvc_home
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://qa/clearsale/cvc_home
    - include_empty: True

farm:
  file.recurse:
    - name: /u01/clearsale/hom/farm
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://qa/clearsale/farm
    - include_empty: True

config:
  file.recurse:
    - name: /u01/clearsale/hom/config
    - user: root
    - group: root
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://qa/clearsale/config
    - include_empty: True
