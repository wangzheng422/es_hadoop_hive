FROM es:base


USER root
# https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html#_c_customized_image
ADD elasticsearch.yml /usr/share/elasticsearch/config/
RUN chown elasticsearch:elasticsearch /usr/share/elasticsearch/config/elasticsearch.yml

USER elasticsearch

#RUN bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:6.2.3.2

# RUN bin/elasticsearch-plugin install ingest-geoip

# RUN bin/elasticsearch-plugin install ingest-user-agent

