/etc/security/limits.d/10-oracle.conf:
    file.managed:
        - source: salt://common/files/limits_oracle.conf
