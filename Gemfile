source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'haml-rails', '~> 2.0'
gem 'devise_invitable', '~> 2.0.0'
gem 'fast_jsonapi'
gem 'carrierwave', '~> 2.0'

# Inspection
gem 'rubocop', '~> 0.92.0', require: false
gem 'rubocop-performance', '~> 1.8.1', require: false
gem 'rubocop-rails', '~> 2.8.1', require: false
gem 'rubocop-rake', '~> 0.5.1', require: false
gem 'rubocop-rspec', '~> 1.43.2', require: false

group :development, :test do
  gem 'bundler-audit'
  gem 'bundler-leak', '~> 0.2.0'
  gem 'pry-byebug'
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'letter_opener'
  gem 'faker', :git => 'https://github.com/faker-ruby/faker.git', :branch => 'master'
end

group :development do
  gem 'annotate'
  gem 'brakeman', '~> 4.10.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
