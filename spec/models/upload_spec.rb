require 'rails_helper'

RSpec.describe Upload, type: :model do
  
  # start by validating the bits  
  describe 'validate the presence of model keys' do
    context 'out of the gate' do
        it { should validate_presence_of(:file_name) }
        it { should validate_presence_of(:file_url) }
        it { should validate_presence_of(:file_type) }
        it { should validate_presence_of(:file_size) }
    end
  end
  
end
