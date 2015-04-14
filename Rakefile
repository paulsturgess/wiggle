# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'wiggle'
  #app.identifier = ''

  app.sdk_version = '8.3'
  app.deployment_target = '7.0'

  #app.provisioning_profile = ''
  #app.codesign_certificate = ''
  app.entitlements['get-task-allow'] = true # a development certificate needs get-task-allow set to true
end
