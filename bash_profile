if [ -f ~/.profile ];       then . ~/.profile;       fi
if [ -r ~/.profile.local ]; then . ~/.profile.local; fi

if [ -f ~/.bash_login ];       then . ~/.bash_login;       fi
if [ -r ~/.bash_login.local ]; then . ~/.bash_login.local; fi

if [ -f ~/.bashrc ];       then . ~/.bashrc;       fi
if [ -r ~/.bashrc.local ]; then . ~/.bashrc.local; fi
