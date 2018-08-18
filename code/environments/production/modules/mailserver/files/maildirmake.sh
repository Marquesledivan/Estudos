#! /bin/bash 
for usuarios in $(getent passwd | awk -F: ' $3 >= 1000 {print $1}' | grep -v nobody); do
maildirmake /home/$usuarios/Maildir
maildirmake /home/$usuarios/Maildir/.Enviados
maildirmake /home/$usuarios/Maildir/.Rascunhos
maildirmake /home/$usuarios/Maildir/.Lixeira
maildirmake /home/$usuarios/Maildir/.Spam
chown -R $usuarios:$usuarios /home/$usuarios
done

