# Instructions

*Client*

- `git clone git@github.com:testdouble/lineman-batman-template.git`
- `git checkout foosball-lineman-batman`
- `cd lineman-batman-template`
- `npm install`
- `lineman run`

*Server*

* `git clone git@github.com:ibawt/foosball-ladder.git`
* `bundle install`
* create your foosball-ladder database in sequel pro
* turn off authentication and forgery protection in rails

```ruby
class ApplicationController < ActionController::Base
  # before_filter :authenticate_user!

  # protect_from_forgery

  rescue_from 'ActionController::UnknownFormat' do |exception|
    render :json => exception, :status => :not_acceptable
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render :json => exception, :status => :not_found
  end
end
```

* `be rake db:migrate`
* `be rails s`

# Running Tests

* `lineman run` from 1 terminal window
* `lineman spec` from another terminal window, this will launch Testem and execute specs in Chrome

# TODO

* expose rails csrf on an api endoint
* xhr to get csrf, then bootstrap batman app
* figure out how to do auth
