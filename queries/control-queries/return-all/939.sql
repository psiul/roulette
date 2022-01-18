select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,catalog_returns cr,customer c,customer_address a
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_order_number = cr.cr_order_number and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 466 and cs.cs_hash <= 866 and hd.hd_hash >= 86 and hd.hd_hash <= 419 and a.ca_hash >= 211 and a.ca_hash <= 961
;
