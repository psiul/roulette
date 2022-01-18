select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,date_dim d,catalog_returns cr,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 363 and cs.cs_hash <= 763 and hd.hd_hash >= 235 and hd.hd_hash <= 568 and d.d_hash >= 30 and d.d_hash <= 780
;
