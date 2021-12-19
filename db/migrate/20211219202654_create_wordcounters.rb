class CreateWordcounters < ActiveRecord::Migration[6.0]
  def change
    create_table :wordcounters do |t|
      t.string :word
      t.integer :count

      t.timestamps
    end
  end
end
