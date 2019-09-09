$KNOCK_DESTINATION="remote.server.net"
$knockPort="49899"
$knockPort2="16204"

"Knock port 1"

$tcpClient = New-Object System.Net.Sockets.TcpClient
$tcpClient.BeginConnect($KNOCK_DESTINATION, $knockPort, $null, $null) | Out-Null
$tcpClient.Close() | Out-Null

sleep 2

"Knock port 2"

$tcpClient = New-Object System.Net.Sockets.TcpClient
$tcpClient.BeginConnect($KNOCK_DESTINATION, $knockPort2, $null, $null) | Out-Null
$tcpClient.Close() | Out-Null

sleep 1

"Done"
