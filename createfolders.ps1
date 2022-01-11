$folder = "C:\Desktop\Omega"
$file = Import-Csv 'C:\folders.csv' -Delimiter ';' -Encoding Default
$file | 
 % { 
        $path1 = Join-Path $folder $_.groupid; 
        $path2 = Join-Path $folder $_.groupid;
        New-Item -Path $path2 -name $_.id -Type Directory -Force
        $path3 = Join-Path $path2 $_.id;
        New-Item -Path $path3 -name "file1" -Type Directory -Force
        New-Item -Path $path3 -name "file2" -Type Directory -Force
        New-Item -Path $path3 -name "file3" -Type Directory -Force
        New-Item -Path $path3 -name "file4" -Type Directory -Force
        New-Item -Path $path3 -name "file5" -Type Directory -Force
        New-Item -Path $path3 -name "file6" -Type Directory -Force
        New-Item -Path $path3 -name "file7" -Type Directory -Force
        $path4 = Join-Path $path3 "test";
        $acl = Get-Acl $path4;
        $acl.SetAccessRuleProtection($True, $True);
        $rule1 = New-Object System.Security.AccessControl.FileSystemAccessRule('domain\policygroup', 'FullControl',"ContainerInherit,ObjectInherit","None", 'Allow')
        $acl.AddAccessRule($rule1)
        foreach ($access in $acl.access) {
        foreach ($value in $access.IdentityReference.Value) {
            if ($value -eq "test2") {
                $acl.RemoveAccessRule($access) | Out-Null
            }
        }
    }
        $rule2 = New-Object System.Security.AccessControl.FileSystemAccessRule('domail\policygroup', 'ReadandExecute',"ContainerInherit,ObjectInherit","None", 'Allow')
        $acl.AddAccessRule($rule2)

        Set-Acl -Path $path4 -AclObject $acl
}
