# frozen_string_literal: true

require_relative "lib/mtn_open_api/version"

Gem::Specification.new do |spec|
  spec.name = MtnOpenApi::NAME
  spec.version = MtnOpenApi::VERSION
  spec.authors = ["Paul Jeremiah Mugaya"]
  spec.email = ["paulgrammer@koodeyo.com"]

  spec.summary = 'MTN Open API Ruby Gem'
  spec.description = 'A Ruby gem for interacting with MTN Open API.'

  spec.homepage = "https://github.com/koodeyo/mtn_open_api"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/koodeyo/mtn_open_api.git"
  spec.metadata["changelog_uri"] = "https://github.com/koodeyo/mtn_open_api/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "yaml", "~> 0.3.0"
  spec.add_dependency "json", "~> 2.7.1"
  spec.add_dependency 'json-schema', "~> 4.1.1"

  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency 'activesupport', '~> 6.0'
end


