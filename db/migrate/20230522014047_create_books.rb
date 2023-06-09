class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer     :category_id,     null: false
      t.string      :title,           null: false
      t.string      :author,          null: false
      t.text        :description,     null: false
      t.references   :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
