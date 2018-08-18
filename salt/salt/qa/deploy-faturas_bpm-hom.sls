faturas_bpm-farm-hom:
  file.recurse:
    - name: /u01/server/jboss-as-7.2.0.Final/standalone/deployments
    - user: oracle
    - group: oracle
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://qa/faturas_bpm/farm
    - include_empty: True
