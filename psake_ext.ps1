#----------------------------------------------------------#
#   Template expansion                                     #                                  
#----------------------------------------------------------#
function global:expand_templates($data_file, $template_file, $destination_file, $debug = $false) {
    
    if (!$data_file) {
        throw "Path to template data file was not provided"        
     }
     
     if ([System.IO.File]::Exists($data_file) -ne $true) {
        throw "Template data file could not be found --" + $data_file
     }

    if (!$template_file) { 
        throw "Path to template file was not provided"        
     }
     
     if ([System.IO.File]::Exists($template_file) -ne $true) {
        throw "Template file could not be found --" + $template_file
     }
     
     if (!$destination_file) {
        throw "Resulting file was not provided"        
     }


$template_data = Get-Content($data_file)

$data_values = @{}
foreach($line in $template_data) {
    $d= $line.IndexOf(":")
    $length = $line.Length
    
    $data_values.add($line.Substring(0,$d).Trim() , $line.Substring($d+1, ($length-($d+1))))       
}

if ($debug -eq $true) {
    echo "Template Data Loaded: "
    $data_values

    echo ""
    echo "Reading Template File..."
}

[string] $template_text = [System.IO.File]::ReadAllText($template_file) 
if ($debug -eq $true) {
    echo $template_text
    echo ""
    echo "--------------------------------------------"
    echo ""
    echo "Replacing values" 
}

foreach ($item in $data_values.Keys) {
    if ($template_text -eq $null)
    {
        throw "There is a problem with text template"
    }
    if ($debug -eq $true) {
        echo " -- #{$item} with " $data_values.Get_Item($item)
    }
    
    $template_text = $template_text.Replace("#{$item}", $data_values.Get_Item($item).Trim())   
}

$template_text | sc -path $destination_file
if ($debug -eq $true) {
    echo ""
    echo "---------------------------------------------"
    echo $template_text
}

}