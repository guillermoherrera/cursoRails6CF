class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :titulo
      t.integer :status

      t.timestamps
    end
  end
end
