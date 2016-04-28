class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.text :text
      t.references :user

      t.timestamps null: false
    end
  end
end
