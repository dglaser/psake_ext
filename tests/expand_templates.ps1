
. .\psake_ext.ps1

[string]$temp_data = 'C:\workspace\Rex\EmployeeSite\trunk\templates\data\dev\template.data'
[string]$temp_file = 'C:\workspace\Rex\EmployeeSite\trunk\templates\web.config.template'
[string]$dest_file = 'C:\workspace\Rex\EmployeeSite\trunk\templates\web.config'

expand_templates $temp_data $temp_file $dest_file $true


