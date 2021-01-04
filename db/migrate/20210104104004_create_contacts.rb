class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :title, null:false
      t.string :name, null:false
      t.string :email, null:false
      t.text :remark
      t.integer :status

      t.timestamps
    end
  end
end
