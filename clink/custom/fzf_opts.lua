os.setenv("FZF_DEFAULT_OPTS", table.concat({
  "--info=inline-right",
  "--scroll-off=3",
  "--highlight-line",
  "--cycle",
  "--layout=reverse",
  "--border=rounded",
  "--multi",
  "--height=60%",
  "--wrap",
  "--wrap-sign=\"\xE2\x86\xB3 \"",
  "--bind tab:down,shift-tab:up,ctrl-j:down,ctrl-k:up,ctrl-d:half-page-down,ctrl-u:half-page-up,alt-p:toggle-preview,ctrl-space:toggle,alt-k:preview-up,alt-j:preview-down,alt-u:preview-half-page-up,alt-d:preview-half-page-down,alt-g:preview-top,alt-G:preview-bottom",
}, " "))

os.setenv("FZF_CTRL_T_OPTS", [[--preview "fzf-preview.cmd {}" --preview-window=right:50%:wrap:border-rounded]])
os.setenv("FZF_ALT_C_OPTS", [[--preview "fzf-preview.cmd {}" --preview-window=right:50%:wrap:border-rounded]])
os.setenv("FZF_CTRL_R_OPTS", [[--preview "echo {}" --preview-window=down:3:wrap:border-rounded]])
os.setenv("FZF_COMPLETION_OPTS", [[--preview "fzf-preview.cmd {}" --preview-window=right:50%:wrap:border-rounded]])
