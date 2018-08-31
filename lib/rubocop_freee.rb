# frozen_string_literal: true

require 'pathname'
require 'yaml'

require 'rubocop'
require 'rubocop/freee/version'
require 'rubocop/freee/inject'

RuboCop::Freee::Inject.defaults!

# custom cops
require 'rubocop/cop/scope_return_value'
