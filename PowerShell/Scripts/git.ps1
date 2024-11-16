function commit { git add . && git commit $args }
function status { git status }
function push { git push $args }
function pull { git pull $args }

function release {
    # ensure tagver exists
    tagver && 
    git push origin &&
    git tag (tagver patch) &&
    git push origin (tagver)
}

