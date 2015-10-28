class AddSortToFaqs < ActiveRecord::Migration
  def change
        add_column :faqs, :sort, :integer
  end
end
