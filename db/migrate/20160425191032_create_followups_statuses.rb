class CreateFollowupsStatuses < ActiveRecord::Migration
  def change
    create_table :followups_statuses do |t|
      t.references :status, index: true, foreign_key: true
      t.references :followup, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
