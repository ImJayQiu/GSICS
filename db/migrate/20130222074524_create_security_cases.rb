class CreateSecurityCases < ActiveRecord::Migration
  def self.up
    create_table :security_cases do |t|
      t.datetime :datetime
      t.string :dept
      t.string :category
      t.string :detail

      t.timestamps
    end
  end

  def self.down
    drop_table :security_cases
  end
end
