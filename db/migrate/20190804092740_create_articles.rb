class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.text :author
      t.integer :replies, default: 0
      t.integer :visited_count, default:0
      t.integer :user_id

      t.timestamps
    end
  end
end
