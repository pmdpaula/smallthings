#!/usr/bin/env bash
# -*- coding: utf-8 -*-

function hostMemory() {
  _MemServidor=$( free | awk '/^Mem/ {print $2}' )
  _MemServidor=$( echo "scale=2;$_MemServidor/1024/1024" | bc )
  echo ${_MemServidor}
}