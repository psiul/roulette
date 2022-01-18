select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,date_dim d,customer c,household_demographics hd
where cs.cs_order_number = cr.cr_order_number and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 67 and d.d_hash <= 817 and c.c_hash >= 197 and c.c_hash <= 530 and hd.hd_hash >= 322 and hd.hd_hash <= 722
;
