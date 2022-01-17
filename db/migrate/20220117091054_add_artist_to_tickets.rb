class AddArtistToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :artist, :string
  end
end
