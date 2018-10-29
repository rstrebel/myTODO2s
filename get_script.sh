# 1/15
#
#
#

#1/13

#

export JAVA_HOME=/whereis/java/j2sdkx.x.x_17
export ANT_HOME=/libsys/apache-ant-x.x.x
export LOCAL_DIR=/make/CM_SS_TLS/CM_SS_TLS/dev/make_ws
export DMCLI_DIR=\\make\\CM_SS_TLS\\CM_SS_TLS\\dev\\make_ws
export PATH=$PATH:$ANT_HOME:$LOCAL_DIR

export FILE1=$LOCAL_DIR/HMM.properties

DATE=`date +'%%Y%%m%%d%%H%%M'`
LOG_FILE_NAME=CM_SS_TLS_GET_log$DATE
ERROR_FILE_NAME=CM_SS_TLS_GET_ERROR_errorlog$DATE

# This directs std error to the error file
exec 2> $LOCAL_DIR/log/$ERROR_FILE_NAME

echo "******************************************"   > $LOCAL_DIR/log/$LOG_FILE_NAME
echo     JAVA_HOME = $JAVA_HOME                    >> $LOCAL_DIR/log/$LOG_FILE_NAME
echo          PATH = $PATH                         >> $LOCAL_DIR/log/$LOG_FILE_NAME
echo LOG_FILE_NAME = $LOG_FILE_NAME                >> $LOCAL_DIR/log/$LOG_FILE_NAME
echo "******************************************"  >> $LOCAL_DIR/log/$LOG_FILE_NAME

cd /coper/SS_home/SS/chgmgt                 >> $LOCAL_DIR/log/$LOG_FILE_NAME
. ./dmprofile

cd $LOCAL_DIR

/coper/SS_home/SS/chgmg/prog/SSCLI -param $FILE1 -cmd "DOWNLOAD /WORKSET=CM_SS_TLS:CM_SS_TLS /DIRECTORY="Scripts\\makeTools" /RECURSIVE /USER_DIRECTORY="$SSCLI_DIR\\make_in" /OVERWRITE /NOMETADATA" >> $LOCAL_DIR/log/$LOG_FILE_NAME

######$ANT_HOME/bin/ant -f $LOCAL_DIR/make_in/make/make.xml compile >> $LOCAL_DIR/log/$LOG_FILE_NAME 

echo "---------    BEGIN ERROR MESSAGES  -------" >>  $LOCAL_DIR/log/$LOG_FILE_NAME
cat $LOCAL_DIR/log/$ERROR_FILE_NAME               >>  $LOCAL_DIR/log/$LOG_FILE_NAME
echo "---------    END ERROR MESSAGES    -------" >>  $LOCAL_DIR/log/$LOG_FILE_NAME

echo "                                          " >> $LOCAL_DIR/log/$LOG_FILE_NAME
echo "******************************************" >> $LOCAL_DIR/log/$LOG_FILE_NAME
echo "-----  END OF PROCESS                -----" >> $LOCAL_DIR/log/$LOG_FILE_NAME
echo "******************************************" >> $LOCAL_DIR/log/$LOG_FILE_NAME

