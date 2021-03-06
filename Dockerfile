From ubuntu:latest

MAINTAINER leonardo.foderaro@gmail.com

RUN sudo apt-get update

RUN sudo apt-get install -y wget

RUN sudo apt-get install -y software-properties-common python-software-properties

RUN sudo add-apt-repository -y ppa:webupd8team/java

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

RUN sudo apt-get update

RUN sudo apt-get -y install oracle-java8-installer

RUN export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre/

RUN useradd -ms /bin/bash alba

RUN echo 'alba:alba123!' | chpasswd

RUN mkdir /opt/solr

# RUN mkdir /home/alba/albabooks-solr-collection/

# RUN apt-get update

# RUN apt-get -y install git

# RUN apt-get -y install zip

# RUN echo 1 && git clone https://github.com/leonardofoderaro/albabooks-solr-collection /home/alba/albabooks-solr-collection

# RUN chown -R alba:alba /opt/solr/

ADD solr-5.2.1.tgz /opt/solr

RUN mkdir -p /opt/solr/solr-5.2.1/custom-libs/

COPY alba-0.1.0-SNAPSHOT.jar /opt/solr/solr-5.2.1/custom-libs/alba-0.1.0-SNAPSHOT.jar

COPY alba.books-0.0.1-SNAPSHOT.jar /opt/solr/solr-5.2.1/custom-libs/alba.books-0.0.1-SNAPSHOT.jar

# RUN echo 1 && /opt/solr/solr-5.2.1/bin/solr -e cloud -noprompt

# RUN ls -la /home/alba/

EXPOSE 8983

EXPOSE 9983

# RUN cat /home/alba/albabooks-solr-collection/upconfig.sh

# RUN cd /home/alba/albabooks-solr-collection/ && ./upconfig.sh

CMD /opt/solr/solr-5.2.1/bin/solr -e cloud -noprompt && tail -f /opt/solr/solr-5.2.1/bin/solr
