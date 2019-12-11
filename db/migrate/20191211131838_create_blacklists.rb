class CreateBlacklists < ActiveRecord::Migration[6.0]
  def change
    create_table :blacklists do |t|
      t.references :user, foreign_key: true
      t.references :establishment, foreign_key: true


      t.timestamps
    end
  end
end
