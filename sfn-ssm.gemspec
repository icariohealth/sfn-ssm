$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__)) + '/lib/'
require 'sfn-ssm/version'
Gem::Specification.new do |s|
  s.name = 'sfn-ssm'
  s.version = SfnSSM::VERSION.version
  s.summary = 'SparkleFormation Parameters - SSM Resolver'
  s.author = "Ryan O'Keeffe"
  s.email = 'ryan.okeeffe@novu.com'
  s.homepage = 'https:/www.novuhealth.com'
  s.description = 'SparkleFormation Parameters - SSM Resolver'
  s.license = 'Apache-2.0'
  s.require_path = 'lib'
  s.add_runtime_dependency 'sfn-parameters', '>= 0.3.0'
  s.add_runtime_dependency 'aws-sdk-ssm'
  s.add_development_dependency 'rake', '~> 10'
  s.add_development_dependency 'rspec', '~> 3.5'
  s.add_development_dependency 'simplecov', '~> 0.16'
  s.add_development_dependency 'rubocop', '~> 0.60'
  s.files = Dir['{lib,bin,docs}/**/*'] + %w(sfn-ssm.gemspec README.md CHANGELOG.md LICENSE)
end
