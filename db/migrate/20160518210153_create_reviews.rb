class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :body
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :move, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
