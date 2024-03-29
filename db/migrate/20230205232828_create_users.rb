class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :review_display_name, default: "", null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.string :primary_dining_location, default: "", null: false
      t.string :dietary_preferences, default: "", null: false
      t.string :special_requests, default: "", null: false
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
    add_index :users, :session_token, unique: true
  end
end
