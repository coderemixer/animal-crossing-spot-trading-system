#!/bin/bash

bundle exec rake db:migrate
bundle exec rake run:prod
