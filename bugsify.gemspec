# frozen_string_literal: true

require_relative "lib/bugsify/version"

Gem::Specification.new do |spec|
  spec.name = "bugsify"
  spec.version = Bugsify::VERSION
  spec.authors = ["Aleksandar Popovic"]
  spec.email = ["aleksandar.popovic@hotmail.com"]

  spec.summary = "Ruby notifier for bugsify.io"
  spec.description = "Bugsify error monitoring & exception reporter for Ruby"
  spec.homepage = "https://github.com/bugsify/bugsify_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bugsify/bugsify_ruby"
  spec.metadata["changelog_uri"] = "https://github.com/bugsify/bugsify_ruby/blob/main/CHANGELOG.md"

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
