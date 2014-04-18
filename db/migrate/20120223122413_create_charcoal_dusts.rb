class CreateCharcoalDusts < ActiveRecord::Migration
  def self.up
    create_table :charcoal_dusts do |t|
      t.string :charcoal_id
      t.string :bweight # bag weight
      t.string :pweight # partical weight

      t.timestamps
    end
  end

  def self.down
    drop_table :charcoal_dusts
  end
end
