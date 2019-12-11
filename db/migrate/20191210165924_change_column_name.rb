class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :establishments, :type, :type_of
  end
end
