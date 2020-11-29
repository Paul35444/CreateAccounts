#!\bin\bash
Import-Module ActiveDirectory

#Add users to OU=Sales by creating path
	$ou = "OU=Sales,DC=PRACTICELABS,DC=COM"

#Ask user to input username and assign to $username
	$username = Read-Host "Enter username"
#Ask user to enter number of accounts to create and assign to $num
	$num = Read-Host "Enter Number of Accounts to create"

#Increase the count to the number of account numbers entered and assign it to $count so we can loop through it
	$count = 1..$num

#Loop through the number of items in the count
	foreach($i in $count) {
#Create a new user and append the count number to the end of hte username and assign password to each new account
		New-ADUser -Name $username$i -Path $ou -Enabled $True -ChangePasswordAtLogon $true
	-AccountPassword (ConvertTo-SecureString "P@ssW0rd" -AsPlainText -Force) -passThru 
		}
