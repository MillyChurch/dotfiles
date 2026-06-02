# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# --- Configuração Base de Autocomplete ---
autoload -Uz compinit
compinit

# --- Integração do FZF no TAB (Navegação de diretórios) ---
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
# Desativa o menu antigo do zsh para não conflitar com o fzf-tab
zstyle ':completion:*' menu no

# --- Sugestões e Cores ---
# AVISO: O syntax-highlighting deve sempre ser o ÚLTIMO plugin a ser carregado
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# source ~/.fzf-tab/fzf-tab.plugin.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#888888'

# Remove a função padrão do Tab (que seria abrir o menu de completação)
#bindkey -r '^I'

# Devolve o autocompletar padrão ao Tab (remove o fzf do cd)
bindkey '^I' autosuggest-accept

# Define o menu de opções/flags do fzf-tab para o Ctrl + T
bindkey '^@' fzf-tab-complete

# Pular palavras rapidamente usando Ctrl + Setas
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
