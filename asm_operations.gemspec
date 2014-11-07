# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'asm_operations/version'

Gem::Specification.new do |s|
  s.name         = 'ASMOperations'
  s.version      = ASMOperations::VERSION
  s.summary      = 'Assembly types and operations'
  s.description  = 'Simple project, right now supports only basic types, later on i will add more assembly operations'
  s.authors      = ['Lefteris Georgatos']
  s.email        = 'lefteros.georgatos@gmail.com'
  s.files        = ['lib/asm_operations.rb']
  s.homepage     = 'http://georgatos.gr'
  s.license      = 'MIT'

  s.add_runtime_dependency 'thor', '0.19.1'
  s.add_development_dependency 'rspec', '3.1.0'
  s.add_development_dependency 'pry', '0.10.1'

  s.files        = Dir.glob('{bin,lib}/**/*') + %w(README.md)
  s.executables  = ['asmp']
  s.require_path = 'lib'
end
