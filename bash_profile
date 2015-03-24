# home folder of the .dotfiles
DOTFILES_HOME="$HOME/.dotfiles" 

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $DOTFILES_HOME/{path,bash_prompt,exports,aliases,functions,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[[ -e "$HOME/.ssh/config" ]] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# ... and the rest
if [[ -f `which brew 2>/dev/null` ]]; then
  if [[ -f `brew --prefix`/etc/bash_completion ]]; then
      . `brew --prefix`/etc/bash_completion
  fi
else
	[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
	    . /usr/share/bash-completion/bash_completion
fi

#load local .profile, if any
if [[ -f ~/.profile ]]
    ~/.profile
fi


