# Overview

This repository contains code for creating a virtual machine using [Vagrant](https://www.vagrantup.com/) that can be used for developing or testing HSS projects. It handles provisioning a VM based on Ubuntu Linux 14.04, installing all necessary packages, checking out the three main HSS repositories ([newhssonline](https://bitbucket.org/hssonline/newhssonline), [django-conference](https://bitbucket.org/django-conference), and [django-elect](https://bitbucket.org/hssonline/django-elect)), installing necessary Python libraries, and setting up the MySQL databases and users.

# Guide

1. Create a [BitBucket](http://bitbucket.org) account if you don't have one and have Mason add you to the [hssonline team](https://bitbucket.org/hssonline/).
    * Make sure to [configure Bitbucket to use your SSH key](https://confluence.atlassian.com/bitbucket/set-up-ssh-for-mercurial-728138122.html) if you haven't already.
2. Install [Vagrant](https://www.vagrantup.com/), [VirtualBox](https://www.virtualbox.org/), and [Mercurial](https://www.mercurial-scm.org/).
3. Clone this repository via `hg clone ssh://hg@bitbucket.org/hssonline/hssonline_vagrant` to a folder you want all the HSS projects to live. The projects will be placed in the parent directory of `hssonline_vagrant`.
4. Run `vagrant up hss` in the `hssonline_vagrant` directory. It will automatically download the files for the OS (~500MB).
    * If you get the error `The Ansible software could not be found`, run `vagrant provision hss`
5. Once it's finished, you should be able to run the tests using the `./run_tests.sh` script and have everything pass.
7. To browse the site, run `./run_server.sh` to start the Django webserver. You should now be able to access it in your browser at `https://localhost:8000`. The site will automatically be in DEBUG mode.
    * The site won't be very usable unless you populate the database. You can do that by downloading a dump of the SQL database to the `hssonline_vagrant` folder and loading it with `vagrant ssh hss -c 'sudo mysql hssonline < /vagrant/DUMPFILENAME.sql'`. Keep in mind the dump contains semi-sensitive information, so take care to delete it and wipe the DBs when you're done.
