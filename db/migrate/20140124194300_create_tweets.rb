require_relative '../config'

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :tweet_id
      t.string :content
      t.belongs_to :congress_member
      t.timestamps
    end
  end
end
