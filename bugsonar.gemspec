# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = "bugsonar"
  spec.version = "0.0.1"
  spec.authors = ["Aleksandar Popovic"]
  spec.email = ["aleksandar.popovic@linux.com"]

  spec.summary = "Exception reporter for Ruby apps"
  spec.description = "Bugsonar error monitoring & exception reporter for Ruby"
  spec.homepage = "https://github.com/bugsonar/bugsonar-ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/bugsonar/bugsonar-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/bugsonar/bugsonar-ruby/blob/main/CHANGELOG.md"

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
