select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,household_demographics hd,customer c,item i
where cs.cs_order_number = cr.cr_order_number and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cr.cr_item_sk = i.i_item_sk and cs.cs_hash >= 247 and cs.cs_hash <= 997 and hd.hd_hash >= 185 and hd.hd_hash <= 585 and i.i_hash >= 457 and i.i_hash <= 790
;
