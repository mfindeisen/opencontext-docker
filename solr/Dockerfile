FROM solr:7.7.2

USER root
RUN mkdir /opencontextCore && chown -R solr:solr /opencontextCore
COPY --chown=solr:solr ./services-core/search/opencontextCore /opencontextCore/
COPY --chown=solr:solr ./create-opencontextCore.sh /docker-entrypoint-initdb.d/
USER solr
RUN chmod -R a+X /opencontextCore
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["solr-foreground"]
