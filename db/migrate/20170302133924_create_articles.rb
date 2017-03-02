class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :idea, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
