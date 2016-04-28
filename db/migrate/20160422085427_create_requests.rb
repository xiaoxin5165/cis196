class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :text
      t.references :sender, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
