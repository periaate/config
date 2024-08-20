Use YouTube info file to set the creation time of files.
```ps1
ls is media | % {
    $name = fsio name $_
    $ab = "$name.info.json"
    $fi = fsio read $ab
    $date = $fi | jq ".upload_date"
    $date = $date | slice 1:-1 str
    $date = $date.Insert(4, "-").Insert(7, "-")
    $dateTime = [DateTime]::ParseExact("$date", "yyyy-MM-dd", $null)
    echo $dateTime
    [System.IO.File]::SetCreationTime("./Music/$_", $dateTime)
}
```
