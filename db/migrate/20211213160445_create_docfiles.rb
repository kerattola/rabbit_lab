class CreateDocfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :docfiles do |t|
      t.string :title

      t.timestamps
    end
  end
end
