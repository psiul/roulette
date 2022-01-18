select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_address a,ship_mode sm
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_hash >= 104 and cs.cs_hash <= 504 and d.d_hash >= 2 and d.d_hash <= 752 and sm.sm_hash >= 516 and sm.sm_hash <= 849
;
