class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :text
      t.integer :upload_id
      t.timestamps null: false
    end

    add_index :summaries, :upload_id
  end
end
