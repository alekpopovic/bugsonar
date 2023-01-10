# frozen_string_literal: true

require_relative "lib/bugsify/config/config"

Gem::Specification.new do |spec|
  spec.name = Bugsify::Config::NAME
  spec.version = Bugsify::Config::VERSION
  spec.authors = Bugsify::Config::AUTHORS
  spec.email = Bugsify::Config::EMAIL

  spec.summary = Bugsify::Config::SUMMARY
  spec.description = Bugsify::Config::DESCRIPTION
  spec.homepage = Bugsify::Config::HOMEPAGE
  spec.license = Bugsify::Config::LICENSE
  spec.required_ruby_version = Bugsify::Config::REQUIRED_RUBY_VERSION

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = Bugsify::Config::SOURCE_CODE_URI
  spec.metadata["changelog_uri"] = Bugsify::Config::CHANGELOG_URI

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.metadata["rubygems_mfa_required"] = "true"
end
