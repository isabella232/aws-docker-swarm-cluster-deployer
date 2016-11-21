#!/usr/bin/env bash


set -o errexit

STATUS_LOG_FILE=log/install_status.log
INSTALL_LOG_FILE=log/install_log.log
mkdir log

rm $STATUS_LOG_FILE ; touch $STATUS_LOG_FILE
rm $ERROR_LOG_FILE ; touch $INSTALL_LOG_FILE

##############################################################
#                      Stack Docker Swarm                    #
##############################################################
make create_docker_swarm >> $INSTALL_LOG_FILE
echo "OK, Provisioning Docker Swarm" >> $STATUS_LOG_FILE
sleep 5


##############################################################
#                      Deploy apps                            #
##############################################################
export `(cat master-elb)` >> $INSTALL_LOG_FILE
bash deployer.sh >> $INSTALL_LOG_FILE
echo "OK, Provisioning Docker Swarm" >> $STATUS_LOG_FILE
