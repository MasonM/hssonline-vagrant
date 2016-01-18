#!/bin/sh
vagrant ssh hss -c 'cd hss/newhssonline; ./manage.py test newhssonline django_elect django_conference'
