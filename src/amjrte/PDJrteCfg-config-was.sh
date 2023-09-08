#!/bin/sh -x
##
## Update these as needed.
##
WAS=/opt/IBM/WebSphere/AppServer
WAS_JAVA=/opt/IBM/WebSphere/AppServer/java/8.0/jre

##
## Make sure the WAS Java is in the path.
## cd $WAS/bin
## . ./setupCmdLine.sh
## which java
## /opt/IBM/WebSphere/AppServer/java/8.0/bin/java
##

java -cp $WAS/tivoli/tam/PD.jar                             \
     -Dpd.home=$WAS/tivoli/tam/PolicyDirector               \
     -Dwas.install.root=$WAS                                \
     com.tivoli.pd.jcfg.PDJrteCfg -was                      \
     -action config -host policy_server_hostname -port 7135 -config_type full -java_home $WAS_JAVA -alt_config -cfgfiles_path $WAS/tivoli/tam

     exit $?
     
