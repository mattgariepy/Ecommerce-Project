class CreateAboutContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :about_contacts do |t|
      t.string :aboutTitle
      t.text :aboutText
      t.string :contactNumber
      t.string :contactEmail
      t.string :contactTitle
      t.text :contactText

      t.timestamps
    end
  end
end
