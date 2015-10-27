class AddDescToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :desc, :text
  end
end
