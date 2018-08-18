admins:
    file.append:
        - name: /etc/sudoers.d/admins
        - text:
          - "%admins    ALL=(ALL)	NOPASSWD: ALL"

middleware:
    file.append:
        - name: /etc/sudoers.d/middleware
        - text:
          - "%middleware ALL = (ALL) NOPASSWD: /bin/su - oracle

oracle    ALL=NOPASSWD:ALL"

oracle:
    file.append:
        - name: /etc/sudoers.d/oracle
        - text:
          - "oracle ALL=NOPASSWD:/etc/init.d/httpd start, /etc/init.d/httpd stop, /etc/init.d/httpd status, /etc/init.d/jboss stop, /etc/init.d/jboss start, /usr/local/sbin/cf-agent -Kv, /usr/bin/killall -9 -u oracle, /etc/init.d/zabbix-agent restart, /bin/ps aux|/bin/grep jb, /bin/rm -rf /u01/jboss/server/default/tmp, /bin/rm -rf /u01/jboss/server/default/work, /bin/rm -f /u01/jboss/server/default/log/*, /bin/rm -f /u01/jboss/server/default/farm/*, /usr/bin/salt-call state.highstate, /bin/bash
            -l -c /etc/init.d/httpd start, /bin/bash -l -c /etc/init.d/httpd stop, /bin/bash -l -c /etc/init.d/httpd status, /bin/bash -l -c /etc/init.d/jboss stop, /bin/bash -l -c /etc/init.d/jboss start, /bin/bash -l -c /usr/local/sbin/cf-agent -Kv, /bin/bash -l -c /usr/bin/killall -9 -u oracle, /bin/bash -l -c /etc/init.d/zabbix-agent restart, /bin/bash -l -c /bin/ps aux|/bin/grep jb, /bin/bash -l -c /bin/rm -rf /u01/jboss/server/default/tmp, /bin/bash -l -c /bin/rm -rf
            /u01/jboss/server/default/work, /bin/bash -l -c /bin/rm -f /u01/jboss/server/default/log/*, /bin/bash -l -c /bin/rm -f /u01/jboss/server/default/farm/*, /bin/bash -l -c /usr/bin/salt-call state.highstate"
