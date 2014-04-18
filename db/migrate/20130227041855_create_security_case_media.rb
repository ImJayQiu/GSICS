class CreateSecurityCaseMedia < ActiveRecord::Migration
  def self.up
    create_table :security_case_media do |t|
      t.string :security_case_id
      t.string :media_file_name
      t.string :media_content_type
      t.integer :media_file_size
      t.datetime :media_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :security_case_media
  end
end
