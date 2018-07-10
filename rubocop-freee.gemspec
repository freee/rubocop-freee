# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'rubocop-freee'
  spec.version = '0.1.0'
  spec.authors = %w[yabu semba waka]
  spec.email = %w[ikezawa-ryota@freee.co.jp semba@freee.co.jp wakahara@freee.co.jp]

  spec.summary = 'this rubocop gem use on internal Ruby Projects'
  spec.description = 'this rubocop gem use on internal Ruby Projects'
  spec.homepage = 'https://github.com/freee/rubocop-freee'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host'
  # To allow pushing to a single host or delete this section to allow pushing to any host.
  unless spec.respond_to?(:metadata)
    raise 'RubyGems 2.0 or newer is required to project against public gem pushes.'
  end
  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject {|f| f =~ %r{^(test|spec|features)/} }
  spec.licenses      = ['MIT']

  spec.add_dependency 'rubocop', '= 0.48.1'
  spec.add_dependency 'rubocop-rspec'
  spec.add_dependency 'rubocop-checkstyle_formatter'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rspec_junit_formatter'
end
