# opencontext-docker
Dockerized opencontext.org <https://github.com/ekansa/open-context-py>

Run ```sh download_static_files.sh``` inside ```open-context-py``` first to download all static files from opencontext.org/static/

Run ```make build``` and ```make up```

A local instance of opencontext should now run at localhost:80.

Run ```make createsuperuser``` to create a Django superuser.

---
# TODO
- [ ] redis
- [ ] download open-context-py directly from its repository <https://github.com/ekansa/open-context-py>
- [ ] better download script for static files