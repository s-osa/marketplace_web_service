# coding: utf-8

project_root = File.join(File.dirname(__FILE__), '..')
$: << project_root

Dir[File.join(File.dirname(__FILE__), "support", "*")].each {|f| require f }

require 'lib/mws'

require 'coveralls'
Coveralls.wear!
