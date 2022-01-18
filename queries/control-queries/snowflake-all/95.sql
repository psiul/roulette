select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer c,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 33 and cs.cs_hash <= 783 and i.i_hash >= 39 and i.i_hash <= 439 and hd.hd_hash >= 6 and hd.hd_hash <= 339
;
