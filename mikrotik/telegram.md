# Telegram bot
## /system script telegram

```bash
#
# Send message to bot: BotName62546
#

:global telegramMessage
:local token
:local chatid

:set token "1872691763:FFFF-RMvnU0Bn8y5IWcfDfdsEdgU_tTVg"

:set chatid "-12345678"

/tool fetch url="https://api.telegram.org/bot$token/sendMessage\?chat_id=$chatid&text=$telegramMessage"
```

## Netwatch up
```bash
:global telegramMessage "Host  DESKTOP-7gt4u is UP :)"
/system script run telegram
```

## Netwatch down
```bash
:global telegramMessage "Host  DESKTOP-7gt4u is DOWN :)"
/system script run telegram
```
