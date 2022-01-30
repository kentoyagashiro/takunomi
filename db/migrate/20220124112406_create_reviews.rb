class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :comment
      t.string :combi
      t.string :buystore
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
