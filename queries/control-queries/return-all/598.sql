select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,household_demographics hd,catalog_returns cr
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 83 and cs.cs_hash <= 416 and c.c_hash >= 86 and c.c_hash <= 836 and d.d_hash >= 159 and d.d_hash <= 559
;
