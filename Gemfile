source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").chomp

# core
gem "config"
gem "devise"
gem "mail-notify"
gem "pg", ">= 0.18", "< 2.0"
gem "pundit"
gem "rails", "~> 6.0.3"

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
  gem "listen", ">= 3.0.5", "< 3.3"
  gem "web-console", ">= 3.3.0"

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
  gem "webdrivers", "~> 4.4"
end
