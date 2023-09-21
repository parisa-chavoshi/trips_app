class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :owner, null: false, foreign_key: {to_table: :users}
      t.references :assignee, null: false, foreign_key: {to_table: :users}
      t.integer :status, null: false, default: 0
      t.boolean :current_assignment, null: false, default: true
      t.datetime :arrival, null: false
      t.datetime :completion, null: false
      t.datetime :checkin
      t.datetime :checkout
      t.string :uuid

      t.timestamps
    end
  end
end
