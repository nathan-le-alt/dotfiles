@echo off
set "p=%~1"
set "p=%p:'=%"
if exist "%p%\" (
  eza -A --color=always "%p%"
) else (
  bat --color=always --style=numbers --line-range :200 "%p%" 2>nul
)

