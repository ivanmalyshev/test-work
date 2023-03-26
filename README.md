## Установить ВМ Debian 8/9, 2core, 2048 memory, 10Gb hdd

в работе используется Debian 10, т.к. версии ПО указанные ниже не поддерживаются уже системами. GPG ключи не проходят проверку и ПО не поставить (см скрипт install.sh)

## 2. Установить необходимое ПО 
1. Vim
2. Wget
3. Htop
4. Tmux
5. Php5.6
6. Nginx (Любая версия. Должен работать на 80 порту)
7. Apache2 (Должен работать на порту 8888)

Все ПО устанавливается вместе с созданием ВМ через vagrant probisioner

Подробности в Vagrantfile

## 3. Работа apache2 на порту 8888
Настройка портов для апача происходит в файле ports.conf. Загружается файл с настройками с локальной машины на гостевую через ансибл. 

## 4. Скрипт на php. 

Для демонстрации есть небольшая страничка calc.php. Доступна по адресу <ip>:8888/calc.php

Для вывода информации о php - <ip>:8888/t.php. В этой странице простой код

```php
<?php phpinfo(); ?>
```
## 5. playbook для обновления php до 7.2 расположен в директории ./update/playbook.yaml

запускается через vagrant provisioner, требуется разкомментировать нужный плейбук в Vagrantfile

