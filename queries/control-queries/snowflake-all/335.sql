select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 132 and cs.cs_hash <= 465 and hd.hd_hash >= 125 and hd.hd_hash <= 525 and c.c_hash >= 129 and c.c_hash <= 879
;
