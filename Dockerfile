FROM python:3.5

MAINTAINER Druhin Bala <druhin.bala@gmail.com>
RUN apt-get update && \
    apt-get install -y nginx && \
    useradd user && \
    groupadd nginx && \
    usermod -a -G nginx user

RUN mkdir -p -m 770 /src/run

WORKDIR /src

ADD . /src
RUN pip3 install -r /src/requirements.txt

RUN ln -s nginx.conf /etc/nginx/sites-enabled/



# CMD ["python3", "/src/manage.py", "runserver", "0.0.0.0:8000"]
# CMD ["/usr/local/bin/uwsgi --http :8000 --module app.wsgi"]

EXPOSE 8000