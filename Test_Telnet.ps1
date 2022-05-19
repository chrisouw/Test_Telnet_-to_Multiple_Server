$server_list = @('10.126.223.213:41001','10.126.223.214:41001','10.126.223.215:41001','10.126.223.216:41001')
#$server_list = @('hostname1:1521', 'hostname2:1521', 'hostname3:1521')

Foreach ($t in $server_list)
{
    $source = $t.Split(':')[0]
    $port = $t.Split(':')[1]
    "Connecting to $source on port $port" | Out-File -FilePath .\outuput.txt -Append
    try
        {
            $socket = New-Object System.Net.Sockets.TcpClient($source, $port)
            "Connected`n" | Out-File -FilePath .\outuput.txt -Append
        }
    catch [Exception]
        {
            $_.Exception.GetType().FullName | Out-File -FilePath .\outuput.txt -Append
            $_.Exception.Message | Out-File -FilePath .\outuput.txt -Append
        }
}
