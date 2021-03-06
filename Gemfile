source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").chomp

# core
gem "config"
gem "devise"
gem "mail-notify"
gem "pg", ">= 0.18", "< 2.0"
gem "pundit"
gem "rails", "~> 6.1.3"

# runtime
gem "bootsnap", ">= 1.1.0", require: false
gem "foreman"
gem "puma", "~> 5.0"

# frontend
gem "govuk-components"
gem "govuk_design_system_formbuilder"
gem "webpacker"

# other
gem "canonical-rails"

# fake data
gem "faker", "~> 2.14"

# Faraday for api calls
gem "faraday", "~> 1.1"
gem "faraday-http-cache", "~> 2.2"
gem "faraday_middleware", "~> 1.0"

# postcode parsing
gem "geocoder", "~> 1.6", ">= 1.6.4"
gem "uk_postcode", "~> 2.1", ">= 2.1.6"

group :development, :test do
  # debug
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-byebug"

  # lint
  gem "rubocop-govuk"
  gem "scss_lint-govuk"

  # testing
  gem "rspec-rails", "~> 4.0.1"

  # setup
  gem "dotenv-rails"
end

group :development do
  # debug
  gem "listen", "~> 3.5.0"
  gem "web-console", "~> 4.1.0"

  # runtime
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  # tools
  gem "rails-erd"
end

group :test do
  gem "capybara", "~> 3.33"
  gem "factory_bot_rails"
  gem "pundit-matchers", "~> 1.6"
  gem "shoulda-matchers", "~> 4.0"
  gem "simplecov", require: false
  gem "vcr"
  gem "webdrivers", "~> 4.4"
end
