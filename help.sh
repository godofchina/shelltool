#!/bin/bash
# 疑问
Color_Text()
{
	echo -e " \x1B[0;$2m$1\x1B[0m"
}

Echo_Red()
{
  	echo $(Color_Text "$1" "31")
}

Echo_Green()
{
  	echo $(Color_Text "$1" "32")
}

Echo_Yellow()
{
  	echo -n $(Color_Text "$1" "33")
}

Echo_Blue()
{
  	echo $(Color_Text "$1" "34")
}

Parse_Sshhost()
{
	ssh_config_path='/Users/nj/.ssh/config'
	SSH_HOSTS=`awk '$1 ~ /host/  {print $2}' $ssh_config_path | paste -sd" " -`
}

Sshost_Selection()
{
	Parse_Sshhost
	Echo_Blue "Choose your ssh host."

	select item in $SSH_HOSTS
	do
	    if [ ! -z "$item" ];then
	        ssh $item
	        break
	    else
	        Echo_Red "$REPLY is not valid."
	    fi
	done
}

Sshost_Selection
exit