select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer c,date_dim d,household_demographics hd
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and cr.cr_returned_date_sk = d.d_date_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 332 and cs.cs_hash <= 732 and c.c_hash >= 198 and c.c_hash <= 948 and hd.hd_hash >= 510 and hd.hd_hash <= 843
;
