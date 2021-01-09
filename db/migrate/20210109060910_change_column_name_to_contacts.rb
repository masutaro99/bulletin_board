class ChangeColumnNameToContacts < ActiveRecord::Migration[5.2]
  def change
    rename_column :contacts, :remark, :content
    change_column :contacts, :title, :text
  end
end
