cd $CATALINA_HOME/bin/
./shutdown.sh
cd $CATALINA_HOME/webapps/
rm clustermanagement-0.0.1-SNAPSHOT.war
rm -r clustermanagement-0.0.1-SNAPSHOT
cd ~/Desktop/
unzip ClusterManagement.zip
cd ClusterManagement
mvn clean package
cd target
cp clustermanagement-0.0.1-SNAPSHOT.war
$CATALINA_HOME/webapps/.
cd $CATALINA_HOME/bin/
./startup.sh

USER='user'
PASSWORD='password'
URL='localhost:1521:orcl'

sqlplus -s<<MYQUERY
${USER}/${PASSWORD}@${URL}
set linesize 32767
set feedback off
set heading off
DROP TABLE IF EXISTS CLUSTERS_DETAILS;
CREATE TABLE CLUSTER_DETAILS(
CLUSTER_ID NUMBER(7) NOT NULL,
CLUSTER_NAME VARCHAR2(50) DEFAULT NULL,
NUMBER_OF_NODES NUMBER DEFAULT NULL,
PRIMARY KEY(CLUSTER_ID)
);
INSERT INTO CLUSTER_DETAILS VALUES(1,'Amazon',850);
INSERT INTO CLUSTER_DETAILS VALUES(2,'Michigan',904);
INSERT INTO CLUSTER_DETAILS VALUES(3,'Rhino',850);
INSERT INTO CLUSTER_DETAILS VALUES(4,'Tahoe',150);
MYQUERY
echo "inserted cluster details succesfully"