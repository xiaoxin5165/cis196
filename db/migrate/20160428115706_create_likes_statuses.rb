class CreateLikesStatuses < ActiveRecord::Migration
  def change
    create_table :likes_statuses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
