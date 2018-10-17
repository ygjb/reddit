source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.3.3'
end

group :development, :production do
  #Create JSON structures via a Builder-style DSL
  gem 'jbuilder', '~> 2.6', '>= 2.6.3'
  gem 'rails', '~> 5.0.2'
  gem 'oj' # for cyrillic symbols
  gem 'oj_mimic_json'
  gem 'pg'
  gem 'devise', '>= 4.2.0'
  gem 'rollbar'
  gem 'jquery-rails', '>= 4.2.2'
  gem 'puma', '~> 3.0'
  gem 'rails_12factor'
  gem 'turbolinks', '~> 5'
  gem 'uglifier', '>= 1.3.0'
  gem 'sass-rails', '~> 5.0', '>= 5.0.6'
  gem 'paperclip', '~> 5.0.0'
  gem 'coffee-rails', '~> 4.2', '>= 4.2.1'
  gem 'haml', '~> 4.0', '>= 4.0.7'
  gem 'bootstrap', '~> 4.0.0.alpha6'
  gem 'simple_token_authentication', '~> 1.15', '>= 1.15.1'
  gem 'kaminari', :git => "git://github.com/amatsuda/kaminari.git", :branch => 'master'
end
group :production do
  gem 'redis', '~> 3.0'
end
group :development, :test do
  gem 'byebug', platform: :mri
  gem 'faker'
  gem 'factory_girl_rails', '>= 4.8.0'
  gem 'rspec-rails', '>= 3.5.2'
end

group :development do
  gem 'web-console', '>= 3.4.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
end
