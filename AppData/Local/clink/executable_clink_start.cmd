@echo off
rem Aliases and functions. Clink runs this file at every cmd start.

rem Config shortcuts
doskey edcmd=vim "%LOCALAPPDATA%\clink\clink_start.cmd"
doskey edvim=vim "%USERPROFILE%\_vimrc"
doskey recmd=call "%LOCALAPPDATA%\clink\clink_start.cmd"
doskey edhistory=vim "%LOCALAPPDATA%\clink\clink_history"

rem User profile (~)
doskey ~ = %USERPROFILE%

rem Clear Unix-like
doskey clear=cls

rem Navigation
doskey ..=cd ..
doskey ...=cd ..\..

rem Listing (install eza first)
doskey ls=eza -lb --long --header --git --color=always --icons=always --group-directories-first $*

rem Ask before delete
doskey rm=del /p $*

rem Public IP
doskey ipe=curl ipinfo.io/ip

rem Package updates
doskey supdate=winget upgrade --all

rem Docker
doskey dcbuild=docker compose build
doskey dcup=docker compose up -d
doskey dcdown=docker compose down
doskey dockps=docker ps --format "{{.ID}} {{.Names}}"
doskey docksh=docker exec -it $1 /bin/bash
doskey dockrst=docker restart $1

rem Git (replaces the Oh My Zsh git plugin)
doskey gst=git status
doskey ga=git add $*
doskey gaa=git add --all
doskey gcmsg=git commit -m $*
doskey gco=git checkout $*
doskey gd=git diff $*
doskey gl=git pull
doskey gp=git push
doskey glog=git log --oneline --graph --decorate


