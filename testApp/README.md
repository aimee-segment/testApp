# TestApp

If  `rerun` is installed, from the parent folder, testApp, execute `rerun 'bin/app.rb'`. This will install and run the app. If you make changes to the source while it's running it will restart for you.

Otherwise, execute `ruby bin/app.rb`.

The webApp from local machine is: `http://localhost:8080/`

Run `bundle install` to ensure Gemfile is up-to-date

## Usage

App behavior + tracking code is in `app.rb`

`hello_form.erb` contains the form fields

`index.erb` is the landing page once you submit the form
