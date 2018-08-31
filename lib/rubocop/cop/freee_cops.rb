module RuboCop
  module Cop
    # RuboCop included the performance cops directly before version 1.0.0.
    # We can remove them to avoid warnings about redefining constants.
    remove_const('Freee') if const_defined?('Freee')
  end
end

require_relative 'freee/scope_return_value'
