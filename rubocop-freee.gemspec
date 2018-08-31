# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'rubocop-freee'
  spec.version = '0.1.0'
  spec.authors = %w[yabu semba waka]
  spec.email = %w[ikezawa-ryota@freee.co.jp semba@freee.co.jp wakahara@freee.co.jp]

  spec.summary = 'this rubocop gem use on internal Ruby Projects'
  spec.description = 'this rubocop gem use on internal Ruby Projects'
  spec.homepage = 'https://github.com/freee/rubocop-freee'

  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject {|f| f =~ %r{^(test|spec|features)/} }
  spec.licenses      = ['MIT']

  spec.add_dependency 'mry'
  spec.add_dependency 'rubocop', '~> 0.57.2'
  spec.add_dependency 'rubocop-checkstyle_formatter'
  spec.add_dependency 'rubocop-rspec', '~> 1.25'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.8'
  spec.add_development_dependency 'rspec_junit_formatter'
end
