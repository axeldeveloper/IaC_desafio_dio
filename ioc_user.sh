#!/bin/bash

# Excluir diretórios, arquivos, grupos e usuários criados anteriormente
echo "Excluindo diretórios, arquivos, grupos e usuários criados anteriormente..."
rm -rf /publico /adm /ven /sec
groupdel GRP_ADM
groupdel GRP_VEM
groupdel GRP_SEC
userdel -r carlos
userdel -r maria
userdel -r joao
userdel -r debora
userdel -r sebastiana
userdel -r roberto
userdel -r josefina
userdel -r amanda
userdel -r rogerio

# Criar diretórios
echo "Criando diretórios..."
mkdir /publico /adm /ven /sec

# Criar grupos
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEM
groupadd GRP_SEC

# Criar usuários e adicionar aos grupos correspondentes
echo "Criando usuários e adicionando aos grupos..."
useradd carlos -m -s /bin/bash -g GRP_ADM
useradd maria -m -s /bin/bash -g GRP_ADM
useradd joao -m -s /bin/bash -g GRP_ADM

useradd debora -m -s /bin/bash -g GRP_VEM
useradd sebastiana -m -s /bin/bash -g GRP_VEM
useradd roberto -m -s /bin/bash -g GRP_VEM

useradd josefina -m -s /bin/bash -g GRP_SEC
useradd amanda -m -s /bin/bash -g GRP_SEC
useradd rogerio -m -s /bin/bash -g GRP_SEC

# Atribuir permissões aos diretórios
echo "Atribuindo permissões aos diretórios..."

# /publico
chmod 777 /publico

# /adm
chmod 770 /adm
chown root:GRP_ADM /adm

# /ven
chmod 770 /ven
chown root:GRP_VEM /ven

# /sec
chmod 770 /sec
chown root:GRP_SEC /sec

# Garantir que os usuários tenham permissão total em seus diretórios
echo "Garantindo permissões específicas para os usuários..."

# Usuários de GRP_ADM terão permissão total no /adm
chmod 770 /adm
chown root:GRP_ADM /adm

# Usuários de GRP_VEM terão permissão total no /ven
chmod 770 /ven
chown root:GRP_VEM /ven

# Usuários de GRP_SEC terão permissão total no /sec
chmod 770 /sec
chown root:GRP_SEC /sec

# Subir o script para o GitHub
echo "Subindo o script para o GitHub..."
git init
git add .
git commit -m "Provisionamento de diretórios, grupos e usuários"
git remote add origin https://github.com/axeldeveloper/IaC_desafio_dio.git
git push -u origin master

echo "Provisionamento concluído com sucesso!"
