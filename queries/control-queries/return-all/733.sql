select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,date_dim d,customer c
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_sold_date_sk = d.d_date_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_hash >= 236 and cs.cs_hash <= 636 and d.d_hash >= 12 and d.d_hash <= 762 and c.c_hash >= 507 and c.c_hash <= 840
;
