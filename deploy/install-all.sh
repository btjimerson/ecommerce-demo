#!/bin/bash

CWD=`pwd`

cd $CWD/../catalog
mvn clean install -DskipTests=true

cd $CWD/../payments
mvn clean install -DskipTests=true

cd $CWD/../orders
mvn clean install -DskipTests=true

cd $CWD/../payment-history
mvn clean install -DskipTests=true

cd $CWD/../frontend
mvn clean install -DskipTests=true

cd $CWD/../loadgenerator
docker build -t harbor.pintobean.xyz/catalog-demo/loadgenerator:1.0.0 .
docker push harbor.pintobean.xyz/catalog-demo/loadgenerator:1.0.0

cd $CWD


exit 0
