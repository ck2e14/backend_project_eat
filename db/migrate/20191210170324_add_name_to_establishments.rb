class AddNameToEstablishments < ActiveRecord::Migration[6.0]
  def change
    add_column :establishments, :name, :string
  end
end
