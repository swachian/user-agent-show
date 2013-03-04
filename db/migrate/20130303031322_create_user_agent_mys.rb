class CreateUserAgentMys < ActiveRecord::Migration
  def change
    create_table :user_agent_mys do |t|
      t.string :browser
      t.string :version
      t.string :os
      t.string :mobile
      t.string :model
      t.string :vendor
      t.string :md5

      t.timestamps
    end
  end
end
