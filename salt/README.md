**Configurações do SaltStack**

*Rodar todas as regras em todas as máquinas*
```bashl
salt '*' state.highstate
```

*Checar as máquinas se estão no ar*
```bash
salt '*' test.ping
```

*Rodar comandos em uma determinada máquina*
```bash
salt 'napsalt*' cmd.run 'uname -a'
```

**Instalação nas máquinas clientes**

**INSTALAÇÃO CENTOS 6**

*Instalação da chave*
```bash
sudo yum install https://repo.saltstack.com/yum/redhat/salt-repo-2016.3-2.el6.noarch.rpm
```

*Instalando os pacotes para o client*
```bash
yum install salt-minion -y
chkconfig salt-minion on
service salt-minion start
```

*Configurando o arquivo de configuração do SaltStack*
```bash
echo 'master: napsalt01.srvadmin.ledivan.com.br' > /etc/salt/minion.d/master.conf

service salt-minion restart
```

**INSTALAÇÃO CENTOS 7**

*Instalação da chave*
```bash
sudo yum install https://repo.saltstack.com/yum/redhat/salt-repo-2016.11-2.el7.noarch.rpm 


sudo yum -y install https://repo.saltstack.com/yum/redhat/salt-repo-latest-2.el7.noarch.rpm
```

*Instalando os pacotes para o client*
```bash
yum install salt-minion -y
systemctl enable salt-minion.service
systemctl start salt-minion.service
```

*Configurando o arquivo de configuração do SaltStack*
```bash
echo 'master: napsalt01.srvadmin.cvc.com.br' > /etc/salt/minion.d/master.conf

systemctl restart salt-minion.service
```

**Rodar o salt na máquina cliente**
```bash
salt-call state.highstate
```

**Aceitar a chave no servidor napsalt01.cvc.com.br**
```bash
(root@napsalt01 - ~ @18:45:19)
0:> salt-key -L
Accepted Keys:
cvcdockerclearsale01
ledivan.com.br
Rejected Keys:

(root@napsalt01 - ~ @18:45:23)
0:> salt-key -A
The following keys are going to be accepted:
Unaccepted Keys:
napoag04.cvc.com.br
Proceed? [n/Y] Y
Key for minion ledivan.com.br accepted.
```
