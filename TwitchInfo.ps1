$path_to_file = Get-ChildItem $PSScriptRoot\data\info.txt

# Get the  list of categories via github raw. So when I update it you don't have to update on your side :)
$source = 'https://raw.githubusercontent.com/dearvoodoo/TP-stream_info/main/data/categories.txt'
$path_to_categories = Get-ChildItem $PSScriptRoot\data\categories.txt
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($source, $path_to_categories)

$path_to_options = Get-ChildItem $PSScriptRoot\data\options.txt

$ico = Get-ChildItem $PSScriptRoot\data\twitch.ico

if (-not(Test-Path $path_to_categories)) {
    "Apex Legends", "Elden Ring", "Fortnite", "Grand Theft Auto V", "Just Chatting", "League Of Legends", "Minecraft", "Overwatch 2", "Sons of the Forest", "Valorant", "Wobbly Life" | Set-Content $path_to_categories -Encoding utf8
}

# Default options
if (-not(Test-Path $path_to_options)) {
    "Cancel", "Done", "Stream Informations", "Please select a stream category:", "Please enter a new stream title:", "Segoe UI" | Set-Content $path_to_categories -Encoding utf8
}

$options = Get-Content $path_to_options

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$font_name = $options[5]
$font_bold_8 = [System.Drawing.Font]::new($font_name, 8, [System.Drawing.FontStyle]::Bold)
$font_bold_12 = [System.Drawing.Font]::new($font_name, 12, [System.Drawing.FontStyle]::Bold)
$font_10 = [System.Drawing.Font]::new($font_name, 10)

$form = New-Object System.Windows.Forms.Form
$form.Icon = New-Object System.Drawing.Icon $ico
$form.Text = $options[2]
$form.Size = New-Object System.Drawing.Size(440,310)
$form.BackColor = [System.Drawing.Color]::FromArgb(16, 16, 16)
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.StartPosition = 'CenterScreen'

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(80,210)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.BackColor = [System.Drawing.Color]::FromArgb(101, 98, 251)
$okButton.ForeColor = [System.Drawing.Color]::White
$okButton.Font = $font_bold_8
$okButton.Text = $options[1]
$okButton.FlatStyle = 'Flat'
$okButton.FlatAppearance.BorderSize = 0
$okButton.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(101, 98, 251)
$okButton.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(62, 59, 189)
$okButton.FlatAppearance.MouseDownBackColor = [System.Drawing.Color]::FromArgb(62, 59, 189)
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(270,210)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.BackColor = [System.Drawing.Color]::FromArgb(41, 45, 51)
$cancelButton.ForeColor = [System.Drawing.Color]::White
$cancelButton.Font = $font_bold_8
$cancelButton.Text = $options[0]
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$cancelButton.FlatStyle = 'Flat'
$cancelButton.FlatAppearance.BorderSize = 0
$cancelButton.FlatAppearance.BorderColor = [System.Drawing.Color]::FromArgb(41, 45, 51)
$cancelButton.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(54, 54, 57)
$cancelButton.FlatAppearance.MouseDownBackColor = [System.Drawing.Color]::FromArgb(87, 87, 87)
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(40,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = $options[4]
$label.Font = $font_bold_12
$label.ForeColor = [System.Drawing.Color]::White
$form.Controls.Add($label)

$textArea = New-Object System.Windows.Forms.TextBox
$textArea.Multiline = $true
$textArea.ScrollBars = "None"
$textArea.BorderStyle = "None" # Add this line to remove the border
$textArea.Location = New-Object System.Drawing.Point(40,45)
$textArea.Size = New-Object System.Drawing.Size(345,75)
$textArea.BackColor = [System.Drawing.Color]::FromArgb(61, 61, 64)
$textArea.Font = $font_10
$textArea.ForeColor = [System.Drawing.Color]::White
$textArea.BorderStyle = [System.Windows.Forms.BorderStyle]::None # Add this line to set the flat style

if (Test-Path $path_to_file)
{
    $content = Get-Content $path_to_file
    $textArea.Text = $content[0]
}

$form.Controls.Add($textArea)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(40,135)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = $options[3]
$label.Font = [System.Drawing.Font]::new("Ariel", 12, [System.Drawing.FontStyle]::Bold)
$label.ForeColor = [System.Drawing.Color]::White
$form.Controls.Add($label)

$dropDown = New-Object System.Windows.Forms.ComboBox
$dropDown.Location = New-Object System.Drawing.Point(40, 160)
$dropDown.Size = New-Object System.Drawing.Size(345, 21)
$dropDown.DropDownStyle = "DropDown"
$dropDown.BackColor = [System.Drawing.Color]::FromArgb(61, 61, 64)
$dropDown.Font = [System.Drawing.Font]::new("Ariel", 10)
$dropDown.ForeColor = [System.Drawing.Color]::White
$dropDown.FlatStyle = 'Flat'
$category = Get-Content $path_to_categories
$dropDown.Items.AddRange($category)
$dropDown.AutoCompleteMode = "SuggestAppend"
$dropDown.AutoCompleteSource = "ListItems"

if (Test-Path $path_to_file)
{
    $content = Get-Content $path_to_file
    $dropDown.SelectedIndex = $dropDown.Items.IndexOf($content[1])
}

$form.Controls.Add($dropDown)
$form.Topmost = $true
$form.Add_Shown({$textArea.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $x = $textArea.Text
    $y = $dropDown.SelectedItem.ToString()
    $x, $y

	if (!(Test-Path $path_to_file))
    {
        New-Item $path_to_file
        Set-Content $path_to_file $x
        Add-Content $path_to_file $y
        Write-Host "Created new file and text content added"
		Exit
    }
    else
    {
        Set-Content $path_to_file $x
        Add-Content $path_to_file $y
        Write-Host "File already exists and new text content added"
		Exit
    }
}