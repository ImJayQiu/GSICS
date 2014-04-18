class CreateEmployeers < ActiveRecord::Migration
  def self.up
    create_table :employeers do |t|
      
      ## Basic Info.
      
      t.string :name_org # Thai name
      t.string :name_ch # Chinese name
      t.string :name_en # English name
      t.string :country
      t.string :gender
      t.date :birth # birthday
      t.string :marriage
      t.string :edu # education background
      t.string :major
      t.string :tel_home
      t.string :mobile
      t.string :id_type # type of identification doc 
      t.string :id_no # no. of identification doc
      t.string :cod_38_1 # 38/1 民事登记
      t.string :address_reg # registered address
      t.string :address_post # post address
      
      
      ## Company Info.
      t.string :employee_no
      t.string :employee_no_old # option if there is an old employee no
      
      t.date :s_date # start working date
      t.date :conf_date # probation finish date
      t.string :em_type # type of employee
      t.string :sub_company # which sub company belonged    
      t.date :wp_date # work permit release date
      
      t.date :e_date # resign date / end working date
      t.string :dept
      t.string :position_org
      t.string :card_no
      
      t.string :annual_leave
      t.string :paid_leave
      t.string :sick_leave
     
      t.string :remark
      
      
      

      t.timestamps
    end
  end

  def self.down
    drop_table :employeers
  end
end
