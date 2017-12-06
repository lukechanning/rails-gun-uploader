RSpec.configure do |config|
    
    # before whole suite
    config.before(:suite) do
        DatabaseCleaner.strategy = :transaction
        DatabaseCleaner.clean_with(:truncation)
    end

    # before each test
    config.before(:each) do
        DatabaseCleaner.start
    end

    # after each test
    config.after(:each) do
        DatabaseCleaner.clean
    end
  
end