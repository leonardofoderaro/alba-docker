## Alba Docker 

A Docker container with SolrCloud and the Alba plugins, so you don't have to modify your existing SolrCloud install.

To build it, you'll need a copy of SolrCloud:

    wget http://mirrors.muzzy.it/apache//lucene/solr/5.2.0/solr-5.2.0.tgz

build:
    docker build -t alba/latest .

run:
   docker run -dit -p 9090:8983 -p 9091:9983 alba/latest
