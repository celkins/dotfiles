# -*- mode: sh -*-

if [ -f ~/.profile ];       then . ~/.profile;       fi
if [ -r ~/.profile.local ]; then . ~/.profile.local; fi

if [ -f ~/.bashrc ];       then . ~/.bashrc;       fi
if [ -r ~/.bashrc.local ]; then . ~/.bashrc.local; fi
