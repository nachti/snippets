#!/usr/bin/Rscript
##### R-Script to clone all Github repositories of a user
##### inspired by hspter (question) and fonnesbeck (py-script):
##### https://gist.github.com/fonnesbeck/064f42fdd5ca67b6a282
##### Gerhard Nachtmann 20160317
library(rjson)
args <- commandArgs(TRUE)

if(length(args) == 0){
    args <- "nachti"
    message(paste0("You didn't provide a Github user, ",
            "so I took the default one (", args, ")"))
}

repos <- paste0("https://api.github.com/users/", args[1], "/repos")
json_data <- fromJSON(file = repos)
gitclone <- function(repo){
    system(paste("git clone", repo$clone_url))
}

invisible(lapply(json_data, gitclone))

### usage:
### download file
### make it executable:
### chmod 755 file
### either copy it to ~/bin or use it directly
### ./gitcloneallrep.R <username>
### e.g.
### ./gitcloneallrep.R hilaryparker
