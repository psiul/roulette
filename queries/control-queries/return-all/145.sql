select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer c,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 559 and d.d_hash <= 959 and i.i_hash >= 470 and i.i_hash <= 803 and c.c_hash >= 234 and c.c_hash <= 984
;
