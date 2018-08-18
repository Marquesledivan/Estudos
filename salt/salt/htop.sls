default:
  # QA Common
  'cvc*.cvc.com.br':
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
  'nap*.cvc.com.br':
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
  '*.colo.cvc.com.br':
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
  'acs*.cvc.com.br':
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
  'cvcdockercoherence01.cvc.com.br':
    - deploy-coherence

  'cvcdockerdss01.cvc.com.br':
    - deploy-dss

  'cvcdockerpphands01.cvc.com.br':
    - deploy-pphands

  'cvccoreprj03.cvc.com.br':
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
  'cvcdockerclearsale01':
    - deploy-clearsale-ti

  'cvccamundati02.cvc.com.br':
    - deploy-faturas_bpm-ti 

qa:
  'cvcdockerclearsale01.cvc.com.br':
    - deploy-clearsale-hom

  'cvccorebatchhom*.cvc.com.br':
    - deploy-batch_hoteis-hom
    - deploy-batch_crm-hom
    - deploy-batch_financial-hom

  'cvccamundahom02.cvc.com.br':
    - deploy-faturas_bpm-hom 

kernel:
  # parametros de Kernel
  'spo*.aws.cvc.com.br':
      - motd.motd-prod
      - common.sysctl
      - common.limits
