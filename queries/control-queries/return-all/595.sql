select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer c,date_dim d,household_demographics hd
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cr.cr_returned_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 60 and cs.cs_hash <= 393 and c.c_hash >= 394 and c.c_hash <= 794 and hd.hd_hash >= 216 and hd.hd_hash <= 966
;
