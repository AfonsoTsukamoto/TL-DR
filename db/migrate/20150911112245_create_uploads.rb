class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.text :text
      t.timestamps null: false
    end
  end
end
