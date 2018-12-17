# Lang   : PowerShell 4.0 script
# Title  : Получения отчета CSV о действительных пользователях AD 
# ver    : 17.12.2018
# Comment: При запуске на основном контроллере требуется повышен привелегий скрипта

"Start AD query..."

$users = get-aduser `
    -Filter {(enabled -eq $true) -and (samAccountName -like "*") -and (samAccountName -notLike "*$") } `
    -Property name, description, distinguishedName, lastLogonDate, created, emailAddress, GivenName, memberOf, POBox

#Дата - три месяца назад
$laterDate = (Get-Date).AddMonths(-3)

"Total users: " + $users.count

$users1 = foreach($U in $users){    

    $samAccountName = $u.samAccountName;
    $groupsStr      = "";

    $_SharedAccounts   = $false;
    $_ExternalAccounts = $false;
    $_ServiceAccounts  = $false;
    $_MailAccounts     = $false;
    $_ciscoVPNuser     = $false;
    $_DismissAccounts  = $false;
    $_ErrorHRAccounts  = $false;
    $_DoubleAccounts   = $false;
    $_GphAccounts      = $false;
    $_UnknownAccounts  = $false;
    $_1CEggsAccounts   = $false;
    $_1CMeatAccounts   = $false;

    foreach($G in $u.memberof){
        $grName    = $G.Split("{,}")[0].split('{=}')[1];
        $groupsStr = "$groupsStr$grName; "

        # нужно для каждого признака сделать доп проверку на true
        $_SharedAccounts   = $grName -like "SharedAccounts"   -or $_SharedAccounts;
        $_ExternalAccounts = $grName -like "ExternalAccounts" -or $_ExternalAccounts;
        $_ServiceAccounts  = $grName -like "ServiceAccounts"  -or $_ServiceAccounts;
        $_MailAccounts     = $grName -like "MailAccounts"     -or $_MailAccounts;
        $_ciscoVPNuser     = $grName -like "ciscoVPNuser"     -or $_ciscoVPNuser;
        $_DismissAccounts  = $grName -like "DismissAccounts"  -or $_DismissAccounts;
        $_ErrorHRAccounts  = $grName -like "ErrorHRAccounts"  -or $_ErrorHRAccounts;
        $_DoubleAccounts   = $grName -like "DoubleAccounts"   -or $_DoubleAccounts;
        $_GphAccounts      = $grName -like "GphAccounts"      -or $_GphAccounts;
        $_UnknownAccounts  = $grName -like "UnknownAccounts"  -or $_UnknownAccounts;
        $_1CEggsAccounts   = $grName -like "1CEggsAccounts"   -or $_1CEggsAccounts;
        $_1CMeatAccounts   = $grName -like "1CMeatAccounts"   -or $_1CMeatAccounts;
    }
    #Идентичность эл. ящика и логина. True - при совпадении
    $emailLogin = "";

    if ( $u.emailAddress.length -ge 1)         {
            $emailLogin = $u.emailAddress.split("{@}")[0];
        }

    [PSCustomObject]@{
        samAccountName    = $u.SamAccountName;
        name              = $u.name;
        description       = $u.Description;
        distinguishedName = $u.distinguishedName;
        lastLogonDate     = $U.LastLogonDate;
        POBox             = $u.POBox;

        #Проверка последнего входа, не позднее 3х месяцев, то True
        НеВходил3месяца     = $U.LastLogonDate -le $laterDate; 

        created      = $u.Created;
        emailAddress = $u.EmailAddress;
        
        ЛогинСоотвествуетПочте  = $emailLogin -eq $u.SamAccountName;

        givenName  = $u.GivenName;
        Группы     = $groupsStr;
        КолвоСлов  = $u.name.Split(" ").count; #Количество слов, разделенных пробелами;

        Общая        = $_SharedAccounts;
        Внешняя      = $_ExternalAccounts;
        Служебная    = $_ServiceAccounts;
        Почтовая     = $_MailAccounts;
        ciscoVPNuser = $_ciscoVPNuser;
        Уволенные    = $_DismissAccounts;
        ОшибкаКадры  = $_ErrorHRAccounts;
        ЗадвоенныеУЗ = $_DoubleAccounts;
        ГПХДоговор   = $_GphAccounts;
        НеНайден     = $_UnknownAccounts;
        МясноеНаправление = $_1CMeatAccounts;
        ЯичноеНаправление = $_1EggsAccounts;

        ОтмеченыТипы = 
            $_SharedAccounts + 
            $_ExternalAccounts + 
            $_ServiceAccounts + 
            $_MailAccounts + 
            $_DismissAccounts + 
            $_ErrorHRAccounts + 
            $_DoubleAccounts + 
            $_GphAccounts + 
            $_UnknownAccounts;
    }
}

$csvFile = (Get-Item -Path ".\").FullName + '\adEnabledUsers.csv';

"Export to file: [" + $csvFile + "]"

$users1 `
    | Sort-Object -Property samAccountName `
    | Export-Csv  -Path $csvFile  -NoType -UseCulture -Encoding UTF8
