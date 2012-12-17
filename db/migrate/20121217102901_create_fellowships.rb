class CreateFellowships < ActiveRecord::Migration
  def change
    create_table :fellowships do |t|
      t.integer :user_id
      t.integer :fellow_id
      t.integer :fellow_id

      t.timestamps
    end
  end
end
