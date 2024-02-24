Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#Set font family for text in variable
$font = New-Object System.Drawing.Font("Times New Roman", 12)
 
$form = New-Object System.Windows.Forms.Form
#Name over the form
$form.Text = 'Computer-Info'
$form.Size = New-Object System.Drawing.Size(385,255)
$form.StartPosition = 'CenterScreen'
 
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(140,170)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)

 
$hostn = New-Object System.Windows.Forms.Label
$hostn.Location = New-Object System.Drawing.Point(10,10)
$hostn.Size = New-Object System.Drawing.Size(280,20)
$hostn.Font = $font
$hostn.Text = "Computer: $(hostname)"
$form.Controls.Add($hostn)
 
$os = New-Object System.Windows.Forms.Label
$os.Location = New-Object System.Drawing.Point(10,90)
$os.Size = New-Object System.Drawing.Size(375,20)
$os.Font = $font
$os.Text = "OS: $((Get-CimInstance win32_operatingsystem).Caption.Trimstart('Microsoft '))"
$form.Controls.Add($os)
 
$mac = New-Object System.Windows.Forms.Label
$mac.Location = New-Object System.Drawing.Point(10,50)
$mac.Size = New-Object System.Drawing.Size(280,20)
$mac.Font = $font
$mac.Text = "MAC: $((Get-NetAdapter | Where-Object Status -EQ 'up').MacAddress)"
$form.Controls.Add($mac)
 
$user = New-Object System.Windows.Forms.Label
$user.Location = New-Object System.Drawing.Point(10,30)
$user.Size = New-Object System.Drawing.Size(280,20)
$user.Font = $font
$user.Text = "User: $env:username"
$form.Controls.Add($user)

$ip = New-Object System.Windows.Forms.Label
$ip.Location = New-Object System.Drawing.Point(10,70)
$ip.Size = New-Object System.Drawing.Size(280,20)
$ip.Font = $font
#Obtain a network adapter with a status of "Up" and a description of "Microsoft" for the virtual machine. A hardware computer requires a filter based on your network adapter.
$ip.Text = "IP: $((Get-NetAdapter | Where-Object {($_.Status -eq 'Up') -and ($_.InterfaceDescription -like 'Microsoft*')} | Get-NetIPAddress -AddressFamily IPv4).IPAddress)"
$form.Controls.Add($ip)

$LinkLabel = New-Object System.Windows.Forms.LinkLabel
$LinkLabel.Location = New-Object System.Drawing.Point(49,110)
$LinkLabel.Size = New-Object System.Drawing.Size(280,20)
$LinkLabel.Font = $font
$LinkLabel.LinkColor = "BLUE"
$LinkLabel.ActiveLinkColor = "RED"
$LinkLabel.Text = "Service"
#Open some link in browser when user click on the 'YourLink'
$LinkLabel.add_Click({[system.Diagnostics.Process]::start("https://www.youtube.com/@IT-HINTS")})
$Form.Controls.Add($LinkLabel)
$help = New-Object System.Windows.Forms.Label
$help.Location = New-Object System.Drawing.Point(10,110)
$help.Font = $font
$help.Size = New-Object System.Drawing.Size(280,20)
$help.Text = "Help:"
$form.Controls.Add($help)

$phone = New-Object System.Windows.Forms.Label
$phone.Location = New-Object System.Drawing.Point(10,128)
$phone.Font = $font
$phone.Size = New-Object System.Drawing.Size(280,20)
$phone.Text = "Phone: 55-55-55"
$form.Controls.Add($phone)

 
$form.Topmost = $true
 
$form.ShowDialog()