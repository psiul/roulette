select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,item i,customer c,household_demographics hd
where cs.cs_order_number = cr.cr_order_number and cr.cr_item_sk = i.i_item_sk and cr.cr_refunded_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 57 and i.i_hash <= 807 and c.c_hash >= 578 and c.c_hash <= 978 and hd.hd_hash >= 224 and hd.hd_hash <= 557
;
