select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,item i,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_hash >= 335 and cs.cs_hash <= 668 and c.c_hash >= 427 and c.c_hash <= 827 and i.i_hash >= 64 and i.i_hash <= 814
;
