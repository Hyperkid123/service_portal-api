class InitTables < ActiveRecord::Migration[5.1]
  def change
    create_table "catalog_item".pluralize.to_sym, id: false do |t|
      t.string :provider_id
      t.integer :portfolio_item_id
      t.string :catalog_id
      t.string :name
      t.string :description
      t.string :image_url

      t.timestamps
    end

    create_table "catalog_plan".pluralize.to_sym, id: false do |t|
      t.string :plan_id
      t.string :name
      t.string :description
      t.string :catalog_id
      t.string :provider_id

      t.timestamps
    end

    create_table "order".pluralize.to_sym do |t|
      t.string :user_id
      t.string :state
      t.datetime :created_at
      t.datetime :ordered_at
      t.datetime :completed_at
      t.string :order_items

      t.timestamps
    end

    create_table "order_item".pluralize.to_sym do |t|
      t.integer :count
      t.string :parameters
      t.string :plan_id
      t.string :catalog_id
      t.string :provider_id
      t.string :order_id
      t.string :state
      t.datetime :created_at
      t.datetime :ordered_at
      t.datetime :completed_at
      t.datetime :updated_at
      t.string :external_ref

      t.timestamps
    end

    create_table "organization".pluralize.to_sym do |t|
      t.timestamps
    end

    create_table "parameter_value".pluralize.to_sym, id: false do |t|
      t.string :name
      t.string :value
      t.string :type
      t.string :format

      t.timestamps
    end

    create_table "plan_parameter".pluralize.to_sym, id: false do |t|
      t.string :type
      t.string :title
      t.string :name
      t.string :description
      t.string :default
      t.string :pattern
      t.string :example
      t.boolean :required
      t.string :format
      t.string :enum

      t.timestamps
    end

    create_table "portfolio".pluralize.to_sym do |t|
      t.string :name
      t.string :description
      t.boolean :enabled
      t.string :image_url

      t.timestamps
    end

    create_table "portfolio_item".pluralize.to_sym do |t|
      t.integer :portfolio_id
      t.boolean :favorite
      t.string :name
      t.string :description
      t.boolean :orphan
      t.string :state

      t.timestamps
    end

    create_table "progress_message".pluralize.to_sym do |t|
      t.datetime :received_at
      t.string :level
      t.string :message
      t.string :order_item_id

      t.timestamps
    end

    create_table "provider".pluralize.to_sym do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :user
      t.string :password
      t.string :token
      t.boolean :verify_ssl

      t.timestamps
    end
  end
end
