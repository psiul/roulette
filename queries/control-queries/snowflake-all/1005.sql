select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,item i,household_demographics hd
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 184 and cs.cs_hash <= 934 and d.d_hash >= 234 and d.d_hash <= 567 and i.i_hash >= 245 and i.i_hash <= 645
;
