class SetStatusDefaultToContact < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :status, :text
  end
end
