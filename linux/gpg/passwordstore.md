# Passwordstore

## GPG initialization
```bash
gpg --gen-key
```
Sample output
```
gpg (GnuPG) 1.4.20; Copyright (C) 2015 Free Software Foundation, Inc.
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.

gpg: создана таблица ключей `/root/.gnupg/secring.gpg'
gpg: создана таблица ключей `/root/.gnupg/pubring.gpg'
Выберите тип ключа:
   (1) RSA и RSA (по умолчанию)
   (2) DSA и Elgamal
   (3) DSA (только для подписи)
   (4) RSA (только для подписи)
Ваш выбор? 
длина ключей RSA может быть от 1024 до 4096 бит.
Какой размер ключа Вам необходим? (2048) 
Запрошенный размер ключа - 2048 бит
Выберите срок действия ключа.
         0 = без ограничения срока действия
      <n>  = срок действия - n дней
      <n>w = срок действия - n недель
      <n>m = срок действия - n месяцев
      <n>y = срок действия - n лет
Срок действия ключа? (0) 
Срок действия ключа не ограничен
Все верно? (y/N) y

Для идентификации Вашего ключа необходим ID пользователя. Программа создаст его
из Вашего имени, комментария и адреса электронной почты в виде:
    "Baba Yaga (pensioner) <yaga@deepforest.ru>"

Ваше настоящее имя: root
Имя не должно быть короче 5 символов
Ваше настоящее имя: RootRoot
Адрес электронной почты: root@localhost
Комментарий: comment
Вы выбрали следующий ID пользователя:
    "RootRoot (comment) <root@localhost>"

Сменить (N)Имя, (C)Комментарий, (E)адрес или (O)Принять/(Q)Выход? O
Для защиты закрытого ключа необходима фраза-пароль.
Пароль: ******

Необходимо сгенерировать много случайных чисел. Желательно, чтобы Вы
выполняли некоторые другие действия (печать на клавиатуре, движения мыши,
обращения к дискам) в процессе генерации; это даст генератору
случайных чисел больше возможностей получить достаточное количество энтропии.

Недостаточно случайных чисел. Займитесь какой-нибудь другой работой,
чтобы ОС могла получить больше случайных данных! (Нужно еще 117 байт)
..+++++
gpg: ключ E295285E помечен как абсолютно доверенный.
открытый и закрытый ключи созданы и подписаны.

gpg: проверка таблицы доверия
gpg: требуется 3 с ограниченным доверием, 1 с полным, модель доверия PGP
gpg: глубина: 0  верных:   1  подписанных:   0  доверие: 0-, 0q, 0n, 0m, 0f, 1u
pub   2048R/E295285E 2017-03-16
      Отпечаток ключа = 85E3 CDCE 2F75 78C4 7CE4  DD07 BBCF 1D25 E295 285E
uid                  RootRoot (comment) <root@localhost>
sub   2048R/47D0430B 2017-03-16
```

[http://eax.me/gpg/](http://eax.me/gpg/)

## Passwordstore 
```bash
pass init "root password storage key"
mkdir: создан каталог '/root/.password-store/'
Password store initialized for root password storage key
```
[https://www.passwordstore.org/](https://www.passwordstore.org/)
http://xmodulo.com/manage-passwords-command-line-linux.html
