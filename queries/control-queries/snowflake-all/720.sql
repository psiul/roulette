select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,customer c,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 408 and d.d_hash <= 808 and i.i_hash >= 319 and i.i_hash <= 652 and c.c_hash >= 200 and c.c_hash <= 950
;
