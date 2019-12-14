class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :authentication_token
      t.string :last_sign_in_ip
      t.string :current_sign_in_ip

      t.timestamps
    end
  end
end
