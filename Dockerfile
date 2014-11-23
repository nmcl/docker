# Base on the Fedora image created by Matthew
FROM fedora

# Install the JBoss Application Server 7
RUN yum install -y java-1.7.0-openjdk-devel git && \
    cd home; git clone https://github.com/nmcl/docker-narayana.git && \
    cd docker-narayana; gzip -d narayana-full-5.0.4.Final-SNAPSHOT.tar.gz; tar -xf narayana-full-5.0.4.Final-SNAPSHOT.tar

# Run the JBoss AS after the container boots
ENTRYPOINT source /home/docker-narayana/narayana-full-5.0.4.Final-SNAPSHOT/jts-setup-env.sh; /home/docker-narayana/narayana-full-5.0.4.Final-SNAPSHOT/bin/start-recovery-manager.sh& /home/docker-narayana/narayana-full-5.0.4.Final-SNAPSHOT/bin/start-transaction-service.sh