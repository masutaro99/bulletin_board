class SetStatusDefaultToContact < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :status, :text, default => "未対応"
  end
end
