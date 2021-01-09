class ChangeStatusToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :status, 'integer USING CAST(status AS integer)'
  end
end