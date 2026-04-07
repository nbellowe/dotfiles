# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/.aliases
source ~/.exports

export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:~/src/git-utils/alias-bin
export PATH="$HOME/.krew/bin:$PATH"

if [[ "$PAGER" == "head -n 10000 | cat" || "$COMPOSER_NO_INTERACTION" == "1" ]]; then
  return
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/tk tk
command -v atuin &>/dev/null && eval "$(atuin init zsh --disable-up-arrow)"

vkey () {
	local cert_name="${HOME}/.ssh/id_ed25519-cert"
	VAULT_ADDR=https://vault.adsrvr.org vault login -method=oidc -path=ops-sso
	VAULT_ADDR=https://vault.adsrvr.org vault write -field=signed_key ssh-client-signer/sign/ops_sso_user valid_principals=nathan.bellowe public_key=@${HOME}/.ssh/id_ed25519.pub >! ${cert_name}
	chmod 700 ${cert_name}
}
[ -f ~/.secrets ] && source ~/.secrets
[ -f ~/.work ] && source ~/.work

fpath=(/custom/completions $HOME/.zprezto/modules/completion/external/src $HOME/.zprezto/modules/helper/functions $HOME/.zprezto/modules/osx/functions $HOME/.zprezto/modules/git/functions $HOME/.zprezto/modules/utility/functions $HOME/.zprezto/modules/prompt/functions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.9/functions)
export PATH="$HOME/.local/bin:$PATH"
