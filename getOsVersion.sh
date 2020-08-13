#!/usr/bin/env bash
# -*- coding: utf-8 -*-

function getOsVersion() {
  arqRelease="$([ -f /etc/system-release ] && ls /etc/system-release || ls /etc/enterprise-release 2> /dev/null)"
  arqRelease="$([ -f /etc/enterprise-release ] && echo ${arqRelease} || ls /etc/redhat-release)"
  versaoSO="$( awk -F"release" '{print $2}' ${arqRelease} | awk -F"(" '{gsub(/^[ \t]+| [ \t]+$/,""); print $1}' | awk -F"." '{print $1 "." $2}')"
  echo ${versaoSO}
}
