select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,catalog_returns cr,household_demographics hd,customer c
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_hash >= 493 and cs.cs_hash <= 826 and d.d_hash >= 303 and d.d_hash <= 703 and hd.hd_hash >= 110 and hd.hd_hash <= 860
;
