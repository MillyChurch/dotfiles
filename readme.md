# 🛠️ Dotfiles

Minhas configurações pessoais para ambiente de desenvolvimento (Zsh, Powerlevel10k, Kitty, etc).

---

## Estrutura

```
.dotfiles/
├── zsh/
│   ├── .zshrc
│   └── .p10k.zsh
├── kitty/
│   └── kitty.conf
```

---

## 🚀 Instalação (local ou servidor)

### 1. Clonar o repositório

```bash
git clone https://github.com/MillyChurch/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

---

### 2. Criar symlinks (sobrescrevendo arquivos existentes)

```bash
# Zsh
rm -f ~/.zshrc ~/.p10k.zsh
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# Kitty
mkdir -p ~/.config/kitty
rm -f ~/.config/kitty/kitty.conf
ln -s ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```

---

## ⚙️ Dependências

Certifique-se de ter instalado:

```bash
sudo apt install zsh git -y
```

---

## 🎨 Tema (Powerlevel10k)

Instale o tema:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

---

## Plugins Zsh

```bash
mkdir -p ~/.zsh

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/Aloxaf/fzf-tab ~/.zsh/fzf-tab
```

---

## fzf (obrigatório)

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
```

---

## Definir Zsh como shell padrão

```bash
chsh -s $(which zsh)
```

Depois disso, reinicie o terminal ou reconecte via SSH.

---

## ⚠️ Observações

* O `.zshrc` é configurado para não quebrar caso plugins não estejam instalados.
* Em servidores (SSH), o prompt pode ficar diferente se não houver Nerd Fonts.
* Os symlinks removem arquivos antigos antes de criar novos.
---
