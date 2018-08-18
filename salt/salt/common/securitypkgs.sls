securitypkgs:
  pkg.latest:
    - pkgs:
      - glibc
      - bash
      - tzdata
      - sudo
    - skip_verify: True
    - refresh: True