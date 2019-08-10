class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.integer :article_id
      t.integer :user_id
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
