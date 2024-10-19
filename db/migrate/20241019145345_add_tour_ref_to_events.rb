class AddTourRefToEvents < ActiveRecord::Migration[7.2]
  def change
    add_reference :events, :tour, foreign_key: true
  end
end
