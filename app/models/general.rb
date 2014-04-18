#coding:utf-8
# To change this template, choose Tools | Templates
# and open the template in the editor.

class General
  
  ROLES = %w[admin prod_packing qc_master qc sampler qc_inspector material visitor super_visitor warehouse_manager warehouse_master warehouse_staff it_staff marketing microsilica_staff microsilica_master microsilica_manager oxygen_staff microsilica_visitor HR_Manager HR_Staff accounting_staff facility_manager daily_report ceo weight_room vehicle Security Furnace Purchase_staff Purchase_manager]
  
  LOCATIONS = %w[Office_办公室 Meeting_Room_会议室 Cafeteria_餐厅 ]
  IT_DEVICES = %w[Notebook_笔电 Projector_投影仪 Keyboard_键盘 Mouse_滑鼠]
  
  PACKING_STATUS = %w[Borrowing_尚未归还 N/A Returned_已归还]
  
  ORIGIN = %w[F-1|一号炉 F-2|二号炉 F-3|三号炉 F-4|四号炉 F-5|五号炉 F-6|六号炉 S-1|一号仓 S-2|二号仓 S-3|三号仓 S-4|四号仓 S-5|五号仓]
  
  SECURITY_TYPE = %w[PRODUCTION FIRE STEAL DAMAGE ACCIDENT EXPLOSION VIOLATION ENVIRONMENT TEST OTHERS]
  
  GENDER = %w[Male Female Others]
  
  MARRIAGE = %w[Single Married]
  
  EDU = %w[Grade-6 Grade-9 Grade-12 Vocational Collage University Master PhD] 
      
  IDTYPE = %w[ID_Card Passport]
  
  # For IT Devices Form Only  ##################
  ITOS = %w[windows_xp windows7 ubuntu Others]
  ITTYPE = %w[PC SERVER NOTEBOOK AP HUB PRINTER ROUTER FIREWALL]
  ITRAM = %w[1 2 3 4 5 6 7 8]
  ITBRAND = %w[AUSU ACER DELL HP SONY TOSHIBA LENOVO Others TP-LINK D-LINK CANON SAMSUNG BILLION RICOH ENGENIUS]
  ##############################################
  
  def initialize
    
  end
end
