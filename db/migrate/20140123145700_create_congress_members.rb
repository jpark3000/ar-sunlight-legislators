require_relative '../config'

class CreateCongressMembers < ActiveRecord::Migration
  def change
    create_table :congress_members do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :party
      t.string :state
      t.binary :in_office
      t.string :phone
      t.string :fax
      t.string :website
      t.string :webform
      t.string :gender
      t.date   :birthdate
      t.string :twitter_id

      t.timestamps
    end
  end

end