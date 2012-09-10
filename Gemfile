source :rubygems

# Add dependencies required to use your gem here.
# Example:
#   gem "activesupport", ">= 2.3.5"

gem 'capistrano'

# Mail notification channel dependencies
#gem 'actionmailer'

# Add dependencies to develop your gem here.
# Include everything needed to run rake, tests, features, etc.
group :development, :test do
  gem 'rspec', "~> 2.11.0"

  gem 'bundler', "~> 1.2.0"

  gem 'ruby-debug', :platforms => [:mri_18, :rbx]
  gem 'pry',        :platforms => [:mri_19]
  gem "reek"
  gem "roodi"
end

group :development do
  gem 'jeweler'
  gem 'yard'
  gem 'rdoc'
  gem 'gemfury'
end

group :test do
  gem 'simplecov',  :require   => false,
                    :platforms => [:mri_19]
end
