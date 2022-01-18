select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,item i,household_demographics hd,customer c
where cs.cs_sold_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 91 and cs.cs_hash <= 841 and i.i_hash >= 359 and i.i_hash <= 759 and c.c_hash >= 456 and c.c_hash <= 789
;
