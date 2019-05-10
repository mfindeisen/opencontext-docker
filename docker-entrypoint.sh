#!/bin/bash

# Apply database migrations
echo "Apply database migrations"
python3 /app/open-context-py/manage.py makemigrations versioning profiles fieldgroups inputfields inputrelations rules trinomials uri entity redirects namespaces subjects ocitem manifest assertions events geospace mediafiles documents persons projects strings octypes octypetree predicates predicatetree identifiers obsmetadata editorials ocmysql fields fieldannotations records sources linkannotations linkentities expfields exprecords exptables indexer search staticfiles debug_toolbar django_user_agents 
python3 /app/open-context-py/manage.py migrate

# Start server
echo "Starting server"
python3 /app/open-context-py/manage.py runserver 0.0.0.0:8000
exec "$@"