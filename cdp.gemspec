# frozen_string_literal: true

require_relative "lib/cdp/version"

Gem::Specification.new do |spec|
  spec.name = "cdp"
  spec.version = Cdp::VERSION
  spec.authors = ["Aleksandar Popovic"]
  spec.email = ["aleksandar.popovic@hotmail.com"]

  spec.summary = "Ruby notifier for codepop.co.rs"
  spec.description = "Bugsify error monitoring & exception reporter for Ruby"
  spec.homepage = "https://github.com/bugsify/bugsify-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bugsify/bugsify-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/bugsify/bugsify-ruby/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
