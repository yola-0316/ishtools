#!/usr/bin/env bash

Sleep_Sec()
{
  seconds=$1
  while [ "${seconds}" -ge "0" ];do
    echo -ne "\r     \r"
    echo -n ${seconds}
    seconds=$(($seconds - 1))
    sleep 1
  done
  echo -ne "\r"
}