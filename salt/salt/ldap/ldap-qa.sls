nss-pam-ldapd:
  pkg.installed: []

auth-ldap-qa:
  cmd.run:
    - name: /usr/sbin/authconfig --enableldap --enableldapauth --ldapserver=XXXX --ldapbasedn=ou=dev,dc=XXX,dc=XXX,dc=XX --updateall --enablemkhomedir --enablecache
    - unless: getent passwd
    - require: 
      - pkg: nss-pam-ldapd 
