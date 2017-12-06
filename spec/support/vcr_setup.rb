# Disable External Connecctions
WebMock.disable_net_connect!(allow_localhost: true)  

# Configure VCR
VCR.configure do |config|
  config.cassette_library_dir = "spec/vcr"
  config.hook_into :webmock
end

# Add wrapper to all RSpec requests
RSpec.configure do |config|
    config.around(:each) do |example|
        options = example.metadata[:vcr] || {}
        if options[:record] == :skip 
          VCR.turned_off(&example)
        else
          name = example.metadata[:full_description].split(/\s+/, 2).join('/').underscore.gsub(/\./,'/').gsub(/[^\w\/]+/, '_').gsub(/\/$/, '')
          VCR.use_cassette(name, options, &example)
        end
      end
end
