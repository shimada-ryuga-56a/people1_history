class ChangeBirthPlaceToInteger < ActiveRecord::Migration[8.0]
  def change
    change_column :members, :birth_place, 'integer USING CAST(birth_place AS integer)'
  end
end
