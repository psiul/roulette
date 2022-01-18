select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 88 and d.d_hash <= 488 and c.c_hash >= 106 and c.c_hash <= 439 and i.i_hash >= 210 and i.i_hash <= 960
;
