## Alba Docker 

    wget http://mirrors.muzzy.it/apache//lucene/solr/5.2.0/solr-5.2.0.tgz

build:
    docker build -t leonardofoderaro/alba .

run:
   docker run -dit -p 9090:8983 -p 9091:9983 leonardofoderaro/alba
