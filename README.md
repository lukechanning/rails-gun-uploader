# RailsGun: Simple Upload Engine

A super simple upload engine with Amazon S3 integration out of the box. Highly modular and test driven to demonstrate TDD principles. This also makes it super easy to add additional upload integrations. 

Feel free to use the app as a launchpad for your own projects! Fork to add additional integrations through Services, eg. Box, Google Cloud Storage, etc.

### [View a Live Demo of RailsGun](https://railsgun.herokuapp.com)

## Getting Started

RailsGun is incredibly simple and easy to use. If you're already a Rails user, you should be able to install and deploy the app without struggle.

### Prerequisites

RailsGun has just a few major prerequisites:

```
gem 'rails', '~> 5.1.4'
gem 'aws-sdk', '~> 3'
gem 'pg', '~> 0.18'
```
Following standard installation instructions, you will not need to worry about these. However, if you want to _modify_ any of these core dependencies, the app will need to be rewritten.

### Installing

Installing RailsGun is simple, and should be familiar to most Ruby / Rails users:

#### Copy the source to your local directory

```
git clone git@github.com:lukechanning/rails-gun-uploader.git
```

Install dependencies with [Bundler](https://github.com/bundler/bundler)

```
bundle install
```
Edit your local database configuration within `config/database.yml` and prepare the database by performing migrations.

```
rails db:setup
```

You'll need to set a few environmental variables to use the preconfigured AWS service. The app also notably comes with Recaptcha through `/app/views/uploads/new.html.erb`. This requires a few API keys from Google, so be [sure to snag those](https://www.google.com/recaptcha) for your domain.

You'll need to add the following items to your server or [dotenv](https://github.com/bkeepers/dotenv) file, as shown here: 

```
# Using .env for local development, server configuration should be used for prod

AWS_ACCESS_KEY_ID = ARANDOMSTRINGOFLETTERS
AWS_SECRET_ACCESS_KEY = ANOTHERSTRINGFORAPIUSAGE
S3_BUCKET = your-bucket-here
S3_REGION = us-west-2

RECAPTCHA_SITE_KEY = ANOTHERAPIKEYFROMGOOGLE
RECAPTCHA_SECRET_KEY = BESURETOADDANOTHERONEHERE
```

Finally, crank up the RailsGun by starting the Puma server. 

```
rails s
```

From your locally running instance of the application, you should now be able to begin uploading and editing items within your bucket. 

## Running the tests

Automated tests have been created using RSpec, Capybara, VCR and Selenium. All tests are contained within the `spec` folder at the root directory. 

Tests for RailsGun are broken into smaller unit tests, as well as one larger integration test for the uploader itself. These tests are:

### End to end with uploader_spec.rb

We're using `/spec/features/uploads/uploader_spec.rb` to test the uploaders potential, from the view down to the S3 service and Uploads controller. The test will create a temporary upload, provide a name and a file from the `Public` directory, and validate that a new `Upload` was successfully created. 

```
# run integration test
bundle exec rspec ./spec/features/uploads/uploader_spec.rb --format documentation
```
`uploader_spec.rb` provides a preconfigured `:file_name` and `:file`, but modify these to match your requirements.

### Individual unit tests

Additional tests are provided to validate the `Upload` model and controller. A service spec is also provided to test uploads directly through `AmazonService` at `/spec/services/amazon_service_spec.rb`. 

Run the full test suite using:

```
bundle exec rspec --format documentation
```

#### A note concerning S3 Uploads

All S3 uploads are live, authentic responses. However, VCR will record and mock responses after the first successful request. A bucket will also not duplicate items by default, but will update them. Because we are not using an upload library like [Paperclip](https://github.com/thoughtbot/paperclip) or [Carrierwave](https://github.com/carrierwaveuploader/carrierwave), you will need to explore additional mock and stub options on your own. 

## Built With

* [AWS-SDK](https://github.com/aws/aws-sdk-ruby) - Direct uploads to the S3 bucket
* [RSpec](https://github.com/rspec/rspec) - Unit and integration testing suite
* [Bootstrap v4.0.0.beta](https://github.com/twbs/bootstrap-rubygem) - Twitter Bootstrap gem providing basic styling 

## Authors

* **Luke Patrick** - *Initial work* - [Router Chowder](https://routerchowder.com)

## License

This project is licensed under the MIT License