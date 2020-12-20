class AddColumnFirstNameKana < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :_name_kana, :first_name_kana
  end
end
