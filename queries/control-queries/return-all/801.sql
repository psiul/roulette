select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,date_dim d,item i
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 182 and cs.cs_hash <= 582 and c.c_hash >= 161 and c.c_hash <= 911 and d.d_hash >= 628 and d.d_hash <= 961
;
