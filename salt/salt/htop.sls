default:
  # QA Common
  'ledivan*.ledivan.com.br':
      - motd.motd-qa
      - common.packages
      - common.sysctl
      - common.limits
      - common.selinux
      - common.zabbix-qa
      - common.salt
      - common.backup
      - common.securitypkgs
      - ldap.ldap-qa
      - profile
      - ntp
      - sudoers.qa
      - sshd
  
  # Production
  'nap*.ledivan.com.br':
      - motd.motd-prod
      - common.packages
      - common.sysctl
      - common.selinux
      - common.zabbix-prod
      - common.salt
      - common.backup
      - common.securitypkgs
      - ldap.ldap-prod
      - profile
      - ntp
      - sudoers.production
      - sshd
  '*.colo.ledivan.com.br':
      - motd.motd-prod
      - common.packages
      - common.sysctl
      - common.selinux
      - common.zabbix-prod
      - common.salt
      - common.backup
      - common.securitypkgs
      - ldap.ldap-prod
      - profile
      - ntp
      - sudoers.production
      - sshd

  # Apache CloudStack
  'acs*.ledivan.com.br':
      - motd.motd-prod
      - common.packages
      - common.sysctl
      - common.selinux
      - common.zabbix-prod
      - common.salt
      - common.backup
      - common.securitypkgs
      - ldap.ldap-prod
      - profile
      - ntp
      - sudoers.production
      - sshd

  'docker':
    - match: nodegroup
    - docker.init
    - docker.registry

  'middleware':
    - match: nodegroup
    - common.limits
    - common.sysctl
    - common.crontab

prjs:
  'ledivan.cvc.com.br':
    - deploy-coherence

  'ledivan.cvc.com.br':
    - deploy-dss

  'ledivan.cvc.com.br':
    - deploy-pphands

  'ledivan.cvc.com.br':
    - deploy-backoffice-web
    - deploy-cvc-infra
    - deploy-markup-hotel
    - deploy-novo-fatorvenda
    - deploy-ws-common
    - deploy-ws-crm
    - deploy-ws-financial
    - deploy-ws-hoteis
    - deploy-ws-maritimo
    - deploy-ws-package
    - deploy-ws-promotion
    - deploy-ws-reports
    - deploy-ws-security
    - deploy-ws-maritimo

ti:
  'ledivan':
    - deploy-clearsale-ti

  'ledivan.cvc.com.br':
    - deploy-faturas_bpm-ti 

qa:
  'ledivan.cvc.com.br':
    - deploy-clearsale-hom

  'ledivan*.cvc.com.br':
    - deploy-batch_hoteis-hom
    - deploy-batch_crm-hom
    - deploy-batch_financial-hom

  'ledivan.cvc.com.br':
    - deploy-faturas_bpm-hom 

kernel:
  # parametros de Kernel
  'spo*.aws.ledivan.com.br':
      - motd.motd-prod
      - common.sysctl
      - common.limits
