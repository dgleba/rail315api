class CreateProductFeatures < ActiveRecord::Migration
  def change
    create_table :product_features do |t|
      t.string :name
      t.references :product, index: true
      t.references :pfeature, index: true
      t.integer :active_status
      t.integer :sort

      t.timestamps null: false
    end
    add_foreign_key :product_features, :products
    add_foreign_key :product_features, :pfeatures
  end
end
