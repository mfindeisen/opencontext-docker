FROM solr:6.4

USER root
RUN mkdir /opencontextCore && chown -R solr:solr /opencontextCore
COPY --chown=solr:solr ./services-core/search/opencontextCore /opencontextCore/
COPY --chown=solr:solr ./create-opencontextCore.sh /docker-entrypoint-initdb.d/
USER solr
RUN chmod -R a+X /opencontextCore
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["solr-foreground"]
