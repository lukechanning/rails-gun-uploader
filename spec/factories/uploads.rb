require 'faker'

FactoryBot.define do
  factory :upload do
    file_name     Faker::File.file_name
    file_url      Faker::File.file_name('path/to')
    file_type     Faker::File.mime_type
    file_size     Faker::Number.between(1,356)
  end
end
