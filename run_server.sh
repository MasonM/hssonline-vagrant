#!/bin/sh
vagrant ssh hss -c 'cd hss/newhssonline; ./manage.py runserver 0.0.0.0:8000'
