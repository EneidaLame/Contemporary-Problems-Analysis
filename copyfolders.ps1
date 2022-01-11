$destfolder = "path1"
$srcfolder = "path2"
$file = Import-Csv 'file.csv' -Delimiter ';' -Encoding Default
$file | 
 % { 
        $path = Join-Path $destfolder $_.groupid; 
        $destpath1 = Join-Path $path $_.id;
        $destpath2 = Join-Path $destpath1 'folder\';
        $srcpath = Join-Path $srcfolder $_.FolderName;
        echo $srcpath
        echo $destpath2
        Copy-Item -Path $srcpath -Destination $destpath2 -Recurse
        } 

