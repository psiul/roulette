select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 166 and cs.cs_hash <= 566 and c.c_hash >= 76 and c.c_hash <= 826 and hd.hd_hash >= 200 and hd.hd_hash <= 533
;
