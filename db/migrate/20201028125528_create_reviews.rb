class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.belongs_to :gossip, index:true
      t.belongs_to :user, index:true
      t.belongs_to :review, index:true
      t.timestamps
    end
  end
end
