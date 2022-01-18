select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,household_demographics hd,customer c,item i
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_hash >= 230 and cs.cs_hash <= 980 and c.c_hash >= 200 and c.c_hash <= 600 and i.i_hash >= 54 and i.i_hash <= 387
;
