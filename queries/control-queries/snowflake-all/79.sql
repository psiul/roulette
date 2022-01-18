select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,item i,customer c
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 236 and cs.cs_hash <= 986 and d.d_hash >= 450 and d.d_hash <= 850 and c.c_hash >= 385 and c.c_hash <= 718
;
