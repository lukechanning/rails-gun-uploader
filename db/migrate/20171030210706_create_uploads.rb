class CreateUploads < ActiveRecord::Migration[5.1]
  def change
    create_table :uploads do |t|
      t.string  :file_name 
      t.string  :file_url 
      t.string  :file_type
      t.integer :file_size

      t.timestamps
    end
  end
end
