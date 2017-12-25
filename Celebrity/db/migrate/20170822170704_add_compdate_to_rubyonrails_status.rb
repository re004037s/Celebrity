class AddCompdateToRubyonrailsStatus < ActiveRecord::Migration[5.0]
  def change
    add_column :rubyonrails_statuses, :ga_1_compd, :date
    add_column :rubyonrails_statuses, :ga_2_compd, :date
    add_column :rubyonrails_statuses, :ga_3_compd, :date
    add_column :rubyonrails_statuses, :ga_4_compd, :date
    add_column :rubyonrails_statuses, :ga_5_compd, :date
    add_column :rubyonrails_statuses, :ga_6_compd, :date
    add_column :rubyonrails_statuses, :ga_7_compd, :date
    add_column :rubyonrails_statuses, :ga_8_compd, :date
    add_column :rubyonrails_statuses, :ga_9_compd, :date
    add_column :rubyonrails_statuses, :ga_10_compd, :date
    add_column :rubyonrails_statuses, :ga_11_compd, :date
    add_column :rubyonrails_statuses, :do_1_compd, :date
    add_column :rubyonrails_statuses, :do_2_compd, :date    
    add_column :rubyonrails_statuses, :do_3_compd, :date    
    add_column :rubyonrails_statuses, :do_4_compd, :date    
    add_column :rubyonrails_statuses, :do_5_compd, :date 
  end
end
