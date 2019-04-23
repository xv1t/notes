# Настройка работы с почтой

Требуется как минимум два системных почтовых ящика
1. Системный, на который будут приходить заявки
2. Почтовый ящик пользователя root@localhost

## Sendmail

go to url `/otrs/index.pl?Action=AdminSystemConfiguration`
Set options, for example for yandex.ru

Option                  | Value
------------------------|----------
SendmailModule          | SMTPTLS
NotificationSenderEmail | otrs-email@yandex.ru
SendmailModule::AuthPassword  | ********
SendmailModule::AuthUser | otrs-email@yandex.ru
SendmailModule::Host | smtp.yandex.ru
SendmailModule::Port | 587
SendmailNotificationEnvelopeFrom | otrs-email@yandex.ru


1. /otrs/index.pl?Action=AdminSystemAddress

## Время проверки сообщений

Параметр `Daemon::SchedulerCronTaskManager::Task###MailAccountFetch`

Установить Schedule в `*/2 * * * *` - проверка каждые **2 минуты**, по умолчанию раз в 10 минут
