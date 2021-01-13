build:
	docker-compose build

up:
	docker-compose up -d

up-non-daemon:
	docker-compose up

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose stop && docker-compose start

shell-nginx:
	docker exec -ti nginx /bin/sh

shell-web:
	docker exec -it web /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"

shell-db:
	docker exec -ti db /bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"

collectstatic:
	docker exec web /bin/sh -c "/opt/venv/bin/python3 manage.py collectstatic --noinput"

createsuperuser:
	docker exec -it web /bin/bash -c "/opt/venv/bin/python3 manage.py createsuperuser"

log-uwsgi:
	docker exec -it web /bin/bash -c "cat /tmp/uwsgi_oc.log" 