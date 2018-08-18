middlewarerotate:
    file.append:
        - name: /etc/cron.d/middleware
        - text:
          - "00 06 * * * oracle find /u01/middleware/domains/ -mtime +1 -name '*.log0*' -exec rm -f {} \\;"
          - "00 06 * * * oracle find /u01/middleware/domains/ -mtime +1 -name '*.out0*' -exec rm -f {} \\;"
        - unless: test ! -d /u01/middleware/domains/
