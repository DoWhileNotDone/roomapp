# Rooms App Demo

## Overview

I have used this exercise as a way to learn around some of the languages, tools, and frameworks being used. As such, it will be relatively clunky in places, due to my relative lack of familiarity with some aspects.

The following is a list of the main tools used:

- [Ruby](https://www.ruby-lang.org/en/)
- [Rails](https://rubyonrails.org/)
- [sqlite3](https://www.sqlite.org/index.html)
- [Vagrant](https://www.vagrantup.com/)
- [Apache](https://httpd.apache.org/)
- [Git](https://git-scm.com/)

Running Instructions are to be found below.

## Server Running Instructions - Vagrant

Requires Vagrant and a Virtualisation Engine

https://www.vagrantup.com/downloads.html
https://www.virtualbox.org/wiki/Downloads

Once installed, you can navigate to the root directory of this project (with the VagrantFile), and run
```
vagrant up
```

This will provision a vagrant server with ubuntu 18.04, ruby/rails, sqlite, and apache. It will also create the database, and bring in the gem dependencies.

There will be a lot of commands executed, with information shown in red or green. There shouldn't be anything to worry about, but the check is whether you reach the 'Vagrant Up' message, and there are no exit codes reported.

All being well, it will allow you to browse to the site and start making requests. Further instructions can be found below.

## Server Running Instructions - Other

To set this up without vagrant requires a few hoops to create the expected environment. If necessary these steps can be determined from the VagrantFile.

## Source

This app was created, largely based on the following tutorial: https://guides.rubyonrails.org/getting_started.html

It may be a fairly basic approach, but it felt better to produce something simple than attempt and fail at something more complex.

## Learning

There was a lot of learning to get up to speed with the technologies used here, which inevitably slowed me down, and restricted the time I had to focus on some of the aspects - test suite, auth, documentation. For the tests, I have tried to include a partial representation.

## Limitations / Further Work

As mentioned, a lot of this was new, and there will always be areas to improve following a review. There were sacrifices to get the database, code and web server up and running, which wouldn't be desirable in a production environment.

There is a lot more that could be done around the following aspects:
 - Data Validation
 - SQL Injection/Security
 - Database Indexes and Constraints
 - Exception Handling
 - Logging
 - CSS/HTML/Javascript
 - Flashes/Confirmation Messages
 - Further tests
 - Table sorting/Drop Down Sorting

Specifically, the following are things that, if I had more time and knowledge, I would look into:

- Drop down elements not being the most practical for large lists
- Make more [DRY](https://guides.rubyonrails.org/getting_started.html#using-partials-to-clean-up-duplication-in-views)
- Perhaps archive room/person rather than delete
- Improved functionality/ux around moving/allocating users and rooms
- Improved clarity on a person's allocation
- Limitations of person name being unique
- Pluralise Welcome Page

Naturally, I could have continued with this, but had to draw a line somewhere.

## Server Running Instructions

To SSH onto the running server, from the directory root use:

```
vagrant ssh
```

The URL is 192.168.50.52

On the server, the code is situated in /vagrant/roomsapp

## Running Instructions

When you access the site, the navigation options should make the usage clear.

Things to note:
 - You cannot delete a room or a person if they have current or future occupancy in place
 - You cannot allocate a room or a person more than once for a given date

### Running the Tests 

```
vagrant ssh
cd /vagrant/roomsapp
bin/rails test
bin/rails test:system
```
