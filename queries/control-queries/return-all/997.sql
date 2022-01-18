select count(cs.cs_item_sk)
from catalog_sales cs,customer c,date_dim d,household_demographics hd,catalog_returns cr
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_sold_date_sk = d.d_date_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_hash >= 330 and cs.cs_hash <= 730 and c.c_hash >= 102 and c.c_hash <= 852 and hd.hd_hash >= 389 and hd.hd_hash <= 722
;
