# Cobble Web

Cobble is a social platform that allows peers to share career advice. This repo is home to the web application and the database.

## Technology Stack
- [Ruby 2.5.3](https://www.ruby-lang.org/en/news/2018/10/18/ruby-2-5-3-released/)
- [Rails 5.2.1.1](https://weblog.rubyonrails.org/2018/11/27/Rails-4-2-5-0-5-1-5-2-have-been-released/)
- [PostgreSQL 9.2 and later](https://www.postgresql.org/download/)
- [React 16.6.3](https://reactjs.org/versions)
- [Webpacker](https://github.com/rails/webpacker)
- [Webpacker React](https://github.com/renchap/webpacker-react)
- [Yarn](https://yarnpkg.com/en/docs/install)
- [PhantomJS with @babel/polyfill included in the React registry for testing. The Poltergeist repo has good advice for installing it](https://github.com/teampoltergeist/poltergeist)

## Setup
1. `git clone git@github.com:danrice92/cobble.git` - clone the project down from GitHub.
2. `bundle install` - install dependencies
3. `bundle exec rails db:create` - create the database
4. `bundle exec rails db:migrate` - migrate the database
5. `yarn` - install JavaScript dependencies (run `yarn upgrade` if you are seeing unmet peer dependency warnings)
6. `bundle exec rails s` - start the server at localhost:3000

## Testing
1. `bundle exec rspec`

## Troubleshooting
- You may need to run `bundle exec rails webpacker:install:react` if you are getting unexpected syntax errors in your JavaScript.
