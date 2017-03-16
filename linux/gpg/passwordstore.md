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
gpg: key 38459DDA marked as ultimately trusted
public and secret key created and signed.

gpg: checking the trustdb
gpg: 3 marginal(s) needed, 1 complete(s) needed, PGP trust model
gpg: depth: 0  valid:   1  signed:   0  trust: 0-, 0q, 0n, 0m, 0f, 1u
pub   2048R/38459DDA 2017-03-16
      Key fingerprint = FC69 CCB9 F766 1F8D D5E1  1A10 7060 6C10 3845 9DDA
uid                  Realname (ItsComment) <email@darkstar.com>
sub   2048R/B20268A5 2017-03-16

```

[http://eax.me/gpg/](http://eax.me/gpg/)

## Passwordstore 
Initialize. 
```bash
pass init email@darkstar.com
Password store initialized for email@darkstar.com
```


Links

[https://www.passwordstore.org/](https://www.passwordstore.org/)

http://xmodulo.com/manage-passwords-command-line-linux.html
