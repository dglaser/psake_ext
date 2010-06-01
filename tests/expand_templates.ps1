
. .\psake_ext.ps1

[string]$temp_data = 'test.data'
[string]$temp_file = 'test.template'
[string]$dest_file = 'test.txt'

expand_templates $temp_data $temp_file $dest_file $true


