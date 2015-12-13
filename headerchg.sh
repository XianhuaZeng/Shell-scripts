#!/bin/sh
#
#Script name: headerchg
#
#Purpose: To change the SAS code header box
#
#Input: headerchg protocol time author xx.sas/*.sas
#
#Release Date: 03Dec2015
#
#Developer/Programmer: Xianhua Zeng
#******************************************************************************
#******************************************************************************

if [ $# -lt 3 ]
then
    echo 'Usage: headerchg protocol time author xx.sas/*.sas'
    exit 1
fi

date=`date '+%d%b%Y'`

if [ $# -eq 3 ]
then
    for file in *.sas
    do 
        sed -e "s/\(.*No\:.*\/[ ]\)[0-9a-zA-Z]*/\1$1/;
                s/\(.*Code\:[ ]*\)[ ][0-9]*/\1 $2/;
                s/\([ ]*Author\:[ ]*\)[A-Z][a-z]*[ ][A-Z][a-z]*\([ ]\$.*\)/\1$3\2/;
                s/\([ ]*Creation.*[ ]*\)[ ].*\([ ]\/[ ].*\)/\1 $date\2/" $file > $file.new
   
	 mv $file.new $file
 
	 echo $file done 
    done
else
    while [ $# -gt 3 ]
    do
        sed -e "s/\(.*No\:.*\/[ ]\)[0-9a-zA-Z]*/\1$1/;
                s/\(.*Code\:[ ]*\)[ ][0-9]*/\1 $1/;
                s/\([ ]*Author\:[ ]*\)[A-Z][a-z]*[ ][A-Z][a-z]*\([ ]\$.*\)/\1$3\2/;
                s/\([ ]*Creation.*[ ]*\)[ ].*\([ ]\/[ ].*\)/\1 $date\2/" $4 > $4.new
   
	 mv $4.new $4
 
	 echo $4 done 
	 shift
    done
fi