class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
      t.string :name
      t.references :user, :foreign_key => false
      t.float :amount, :default => 0 #数量
      t.integer :invest_count, :default => 0
      t.float :exp_growth_rate, :default => 0 #预期增长率
      t.float :single_invest_amount, :default => 0 #定投金额
      t.timestamps
    end
    add_column :websites, :investment_id, :integer
  end
end
