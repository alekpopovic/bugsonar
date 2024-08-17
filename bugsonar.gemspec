# frozen_string_literal: true

require_relative "lib/bugsonar/config/config"

Gem::Specification.new do |spec|
  spec.name = Bugsonar::Config::NAME
  spec.version = Bugsonar::Config::VERSION
  spec.authors = Bugsonar::Config::AUTHORS
  spec.email = Bugsonar::Config::EMAIL

  spec.summary = Bugsonar::Config::SUMMARY
  spec.description = Bugsonar::Config::DESCRIPTION
  spec.homepage = Bugsonar::Config::HOMEPAGE
  spec.license = Bugsonar::Config::LICENSE
  spec.required_ruby_version = Bugsonar::Config::REQUIRED_RUBY_VERSION

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = Bugsonar::Config::SOURCE_CODE_URI
  spec.metadata["changelog_uri"] = Bugsonar::Config::CHANGELOG_URI

  spec.files = Dir.chdir(__dir__) do
    %x(git ls-files -z).split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
