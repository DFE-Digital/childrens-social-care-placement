source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").chomp

# core
gem "devise"
gem "pg", ">= 0.18", "< 2.0"
gem "rails", "~> 6.0.3"

# runtime
gem "bootsnap", ">= 1.1.0", require: false
gem "foreman"
gem "puma", "~> 5.0"

# frontend
gem "govuk_design_system_formbuilder"
gem "webpacker"

# other
gem "canonical-rails"

group :development, :test do
  # debug
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"

  # lint
  gem "rubocop-govuk"
  gem "scss_lint-govuk"

  # testing
  gem "capybara", "~> 3.33"
  gem "rspec-rails", "~> 4.0.1"

  # setup
  gem "dotenv-rails"
end

group :development do
  # debug
  gem "listen", ">= 3.0.5", "< 3.3"
  gem "web-console", ">= 3.3.0"

  # runtime
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "webdrivers", "~> 4.4"
end
