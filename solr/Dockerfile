FROM solr:7
 
#COPY solr1_configs /opt/solr/server/solr/configsets/solr1_configs
COPY solr1_configs /opt/solr/server/solr/mycores/collection1/solr1_configs
USER root
#RUN chown -R solr:solr /opt/solr/server/solr/configsets/solr1_configs
RUN chown -R solr:solr /opt/solr/server/solr/mycores/collection1/solr1_configs
COPY solr-entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/solr-entrypoint.sh
USER solr
# CMD ["/opt/solr/bin/solr", "create -c ff"]