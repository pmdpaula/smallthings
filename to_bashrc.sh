
######################################################################
### Configurações administradas automaticamente pela CGNC 
### Não insira nada manualmente entre os limites do "#"
### Estas linhas serão distribuídas com o Ansible através do servidor JON

## Configs para o history
export HISTTIMEFORMAT="%F %T   "
export HISTCONTROL=$HISTCONTROL:ignorespace
export HISTCONTROL=$HISTCONTROL:ignoreboth


export SVN_EDITOR=vim

# A linha abaixo devera ficar no bash_profile do usuario oracle
#export ORACLEVERSAO=`sh /home/oracle/scripts/extrai_versao_oracle.sh | awk '/^SQL\*Plus/ {print $3}'`

function nonzero_return() {
  RETVAL=$?
  [ $RETVAL -ne 0 ] && echo "$RETVAL "
}

function orasid_return() {
	[ ${ORACLE_SID} ] && echo " SID=${ORACLE_SID}"
}

function oraversion_return() {
      [ ${ORACLEVERSAO} ] && echo " ORACLE version=${ORACLEVERSAO}"
    }


if [ `whoami` == "root" ]; then
    export PS1="\[\e[31m\][\[\e[31m\]\u\[\e[31m\]\[\e[1;31m\]@\[\e[0;31m\]\h \[\e[1;31m\]\D{%Y.%m.%d-%H:%M:%S}\[\e[0;31m\] ]\n[ \[\e[33m\]\w\[\e[0;31m\] \`nonzero_return\`]\[\e[m\] "
  elif [ `whoami` == "postgres" -o `whoami` == "mysql" ]; then
      export PS1="\[\e[33m\][\[\e[33m\]\u\[\e[33m\]\[\e[1;33m\]@\[\e[0;33m\]\h \[\e[1;33m\]\D{%Y.%m.%d-%H:%M:%S}\[\e[0;33m\] ]\n[ \[\e[33m\]\w\[\e[0;33m\] \`nonzero_return\`]\[\e[m\] "
    elif [ `whoami` == "oracle" ]; then
          export PS1="\[\e[33m\][\[\e[33m\]\u\[\e[33m\]\[\e[1;33m\]@\[\e[0;33m\]\h \[\e[1;33m\]\D{%Y.%m.%d-%H:%M:%S}\[\e[95m\]\`oraversion_return\`\`orasid_return\`\[\e[0;33m\] ]\n[ \[\e[33m\]\w\[\e[0;33m\] \`nonzero_return\`]\[\e[m\] "
  else
      export PS1="\[\e[36m\][\[\e[36m\]\u\[\e[36m\]\[\e[1;36m\]@\[\e[0;36m\]\h \[\e[1;36m\]\D{%Y.%m.%d-%H:%M:%S}\[\e[0;36m\] ]\n[ \[\e[33m\]\w\[\e[0;36m\] \`nonzero_return\`]\[\e[m\] "
fi

export LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:*.sql=00;37:"

alias "ll=ls -lh"
alias "lh=ls -lh"
alias "lk=ls -lk"
alias dir="ls -l"
alias h="history"
alias l="ls -abxCF"
alias vimp='vim -c "colorscheme koehler" -c "set nu" -c "setlocal formatoptions-=c formatoptions-=r formatoptions-=o" -c "set background=dark"'  
alias verpsql="sh /home/postgres/scripts/verpsql.sh"
alias verora="/home/oracle/scripts/verora.sh"
alias listapmon="ps aux | awk '\$11 ~/ora_pmon/ {print \$11}' | awk -F\"_\" '{print \$3}' | sort"

######################################################################
