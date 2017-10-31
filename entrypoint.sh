#!/bin/bash
cd projectname
./manage.py migrate
/usr/local/bin/uwsgi --http :8000 --chdir=/django-sample-app --module=projectname.wsgi:application --static-map /static=/django-sample-app/static-assets/
