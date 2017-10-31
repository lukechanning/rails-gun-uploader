class Upload < ApplicationRecord
    # validate me, bro!
    validates :file_name, :file_url, :file_type, :file_size, presence: true
end
