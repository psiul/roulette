select count(cs.cs_item_sk)
from catalog_sales cs,item i,customer c,ship_mode sm,date_dim d
where cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_mode_sk = sm.sm_ship_mode_sk and cs.cs_ship_date_sk = d.d_date_sk and i.i_hash >= 321 and i.i_hash <= 721 and c.c_hash >= 628 and c.c_hash <= 961 and d.d_hash >= 49 and d.d_hash <= 799
;
