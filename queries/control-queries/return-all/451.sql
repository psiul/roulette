select count(cs.cs_item_sk)
from catalog_sales cs,catalog_returns cr,customer c,household_demographics hd,customer_address a
where cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and cr.cr_refunded_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 310 and cs.cs_hash <= 710 and hd.hd_hash >= 162 and hd.hd_hash <= 912 and a.ca_hash >= 244 and a.ca_hash <= 577
;
