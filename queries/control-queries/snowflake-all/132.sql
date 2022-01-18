select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,item i,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_item_sk = i.i_item_sk and cs.cs_bill_customer_sk = c.c_customer_sk and hd.hd_hash >= 444 and hd.hd_hash <= 844 and i.i_hash >= 150 and i.i_hash <= 900 and c.c_hash >= 323 and c.c_hash <= 656
;
