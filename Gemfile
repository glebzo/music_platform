source 'https://rubygems.org'
ruby '2.3.1'

# gem 'unicorn-rails'
# gem 'thin'
gem 'puma', '~> 2.15'
gem 'rails', '4.2.6'
gem 'pg', '~> 0.15'

gem 'pjax_rails', '~> 0.4.0'
# gem 'jquery-turbolinks'
gem 'coffee-rails'
gem 'backbone-on-rails'

gem 'jquery-rails'


gem 'haml-rails'
gem 'twitter-bootstrap-rails'
gem 'simple_form'
gem 'simple-line-icons-rails'
gem 'font-awesome-rails'
# gem 'soundcloud'

# Authentication & Authorization
gem 'devise'
# gem 'cancancan'

# Soundtracks
gem 'kaminari'
gem "paperclip", "~> 5.0.0.beta1"

gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
group :development, :test do
  gem 'rspec-rails'
  gem "teaspoon-jasmine"
  gem 'faker'

  if RUBY_VERSION >= '2.0.0'
    gem 'byebug'
  else
    gem 'debugger'
  end
end

group :development do
  gem 'spring'
  # gem 'rails_best_practices', '~> 1.15'
  gem 'better_errors'
  gem 'annotate'
  # gem 'awesome_print', '~> 1.6'
  # gem 'bullet', '~> 5.0'
  # gem 'binding_of_caller'
end

group :test do
  # gem 'database_cleaner'
  gem 'capybara', '~> 2.7.1'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
end