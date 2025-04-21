#!/bin/bash

# Atualizando pacotes
sudo apt update && sudo apt upgrade -y

# Instalando o servidor web (ex: Apache)
sudo apt install apache2 -y

# Habilitando o serviço
sudo systemctl enable apache2
sudo systemctl start apache2

# Copiando um site exemplo
sudo cp -r ./site/* /var/www/html/

echo "Servidor web provisionado com sucesso!"
