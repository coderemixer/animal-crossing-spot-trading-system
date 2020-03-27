#!/usr/bin/env puma

environment 'production'

workers 4

pidfile '.pids/app.pid'
state_path '.pids/app.state'
stdout_redirect '.pids/stdout', '.pids/stderr', true

bind "tcp://0.0.0.0:#{ENV['PORT'] || 9292}"
preload_app!
