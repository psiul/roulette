select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer c,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and hd.hd_hash >= 314 and hd.hd_hash <= 714 and i.i_hash >= 161 and i.i_hash <= 494 and c.c_hash >= 154 and c.c_hash <= 904
;
