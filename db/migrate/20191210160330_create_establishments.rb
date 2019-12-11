class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
