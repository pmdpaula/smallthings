#!/usr/bin/env bash
# -*- coding: utf-8 -*-

function getOsName() {
  arqRealease="$([ -f /etc/system-release ] && ls /etc/system-release || ls /etc/enterprise-release 2> /dev/null)"
  arqRealease="$([ -f /etc/enterprise-release ] && echo ${arqRealease} || ls /etc/redhat-release)"
  nomeSO="$( awk -F"release" '{print $1}' ${arqRealease} | awk '{gsub(/[ \t]+$/,""); print}')"
  echo ${nomeSO}
}
