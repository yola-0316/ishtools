#!/usr/bin/env bash

EXT=".sh"
LIB_DIR_NAME="sh_include"
FALLBACK_LIB="$HOME/.local/share/sh_include"

CALLER_PATH=$(cd "$(dirname "$0")";pwd)

function prepare() {
  if [ ! -d $FALLBACK_LIB ]; then
    echo "$FALLBACK_LIB not exist, create it as fallback lib dir."
    mkdir -p $FALLBACK_LIB
  fi
}

function findFallback {
  if [ -d $FALLBACK_LIB ]; then
    if [ -f "$FALLBACK_LIB/$1$EXT" ]; then
      echo "$FALLBACK_LIB/$1$EXT"
    else
      echo "_N_"
    fi
  else
    echo "_F_N_"
  fi
}

function findlib {
  p=${2:-$CALLER_PATH}
  local libdir="$p/$LIB_DIR_NAME"

  if [ -d $libdir ]; then
    if [ -f "$libdir/$1$EXT" ]; then
      echo "$libdir/$1$EXT"
    else
      local ppath=$(dirname "$p")
      if [ -d $ppath ]; then
        local result=$(findlib $1 $ppath)
        echo "$result"
      else
        local result=$(findFallback $1)
        echo "$result"
      fi
    fi
  else
    local ppath=$(dirname "$p")
    if [ -d $ppath ] && [ $ppath != "/" ]; then
      local result=$(findlib $1 $ppath)
      echo "$result"
    else
      local result=$(findFallback $1)
      echo "$result"
    fi
  fi
}

function load {
  local find_path=$(findlib $1)
  [ -r $find_path ] && . $find_path
  if [ $find_path = "_N_" ] || [ $find_path = "_F_N_" ]; then
    if [ "$2" = "break" ]; then
      echo "load module ($1) err, exit."
      exit 1
    fi
    return 1
  else
    return 0
  fi
}

prepare
