select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,item i,customer c,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and cs.cs_hash >= 35 and cs.cs_hash <= 785 and i.i_hash >= 493 and i.i_hash <= 893 and c.c_hash >= 142 and c.c_hash <= 475
;
