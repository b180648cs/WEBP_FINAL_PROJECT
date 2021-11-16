class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.integer :Book_ID
      t.string :Book_Title
      t.string :Author
      t.string :Publishers
      t.integer :Year

      t.timestamps
    end
  end
end
