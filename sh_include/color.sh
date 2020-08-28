#!/usr/bin/env bash

Color_Text()
{
  echo -e " \033[0;$2m$1\033[0m"
}

Red()
{
  echo $(Color_Text "$1" "31")
}

Red_in()
{
  echo -n $(Color_Text "$1" "31")
}

Green()
{
  echo $(Color_Text "$1" "32")
}

Green_in()
{
  echo -n $(Color_Text "$1" "32")
}

Yellow()
{
  echo $(Color_Text "$1" "33")
}

Yellow_in()
{
  echo -n $(Color_Text "$1" "33")
}

Blue()
{
  echo $(Color_Text "$1" "34")
}

Blue_in()
{
  echo -n $(Color_Text "$1" "34")
}