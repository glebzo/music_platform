class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :soundtrack, index: true
      t.references :listener, index: true
      t.integer :score, default: 0

      t.timestamps null: false
    end
  end
end