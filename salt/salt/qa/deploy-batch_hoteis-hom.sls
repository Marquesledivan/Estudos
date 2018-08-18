create_cvchome_batch_hoteis_hom:
  file.directory:
    - name: /usr/local/cvc_home
    - user: oracle
    - group: oracle
    - mode: 0755
    - makedirs: True

cvc_home_batch_hoteis_hom:
  file.recurse:
    - name: /usr/local/cvc_home
    - user: oracle
    - group: oracle
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://qa/batch-hoteis/cvc_home
    - include_empty: True

upload_batch_hoteis_hom:
  file.recurse:
    - name: /u01/middleware/domains/corebatch_domain/servers/corebatch_admin/upload
    - user: oracle
    - group: oracle
    - dir_mode: 0755
    - file_mode: '0655'
    - source: salt://qa/batch-hoteis/upload
    - include_empty: True
