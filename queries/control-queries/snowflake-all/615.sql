select count(cs.cs_item_sk)
from catalog_sales cs,item i,date_dim d,household_demographics hd,customer c
where cs.cs_item_sk = i.i_item_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and d.d_hash >= 405 and d.d_hash <= 805 and hd.hd_hash >= 419 and hd.hd_hash <= 752 and c.c_hash >= 73 and c.c_hash <= 823
;
