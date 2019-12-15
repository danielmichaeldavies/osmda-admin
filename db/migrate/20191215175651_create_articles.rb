class CreateArticles < ActiveRecord::Migration[6.0]
  def up
    execute <<-DDL
      CREATE TYPE article_risk AS ENUM (
        'negligible', 'low', 'medium', 'high'
      );
    DDL

    create_table :articles do |t|
      t.column :name, :string, null: false
      t.column :risk, :article_risk, default: 'negligible', null: false
      t.column :description, :text
      t.timestamps
    end
  end

  def down
    drop_table :articles
    execute 'DROP type article_risk;'
  end
end
