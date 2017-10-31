FROM debian:stable
RUN apt-get update && apt-get install -y --force-yes python \
python-virtualenv \
python-pip \
python \
libpq-dev \
uwsgi
RUN pip install uwsgi
RUN pip install virtualenv
RUN pip install virtualenvwrapper
RUN /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh \
                  && mkvirtualenv --clear django-sample-app"
COPY . django-sample-app
RUN pip install -r django-sample-app/requirements.txt
RUN chmod a+x django-sample-app/entrypoint.sh
WORKDIR /django-sample-app
EXPOSE 8000
CMD ["./entrypoint.sh"]
