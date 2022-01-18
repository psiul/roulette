select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer c,household_demographics hd,item i
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cr.cr_item_sk = i.i_item_sk and c.c_hash >= 589 and c.c_hash <= 922 and hd.hd_hash >= 172 and hd.hd_hash <= 572 and i.i_hash >= 217 and i.i_hash <= 967
;
