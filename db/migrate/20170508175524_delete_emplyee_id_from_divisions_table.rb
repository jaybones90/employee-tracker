class DeleteEmplyeeIdFromDivisionsTable < ActiveRecord::Migration[5.1]
  def change
    remove_column(:divisions, :employee_id, :integer)
  end
end
