class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.string :author

      t.timestamps
    end
  end
end
