select count(cs.cs_item_sk)
from catalog_sales cs,customer c,catalog_returns cr,customer_address a,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_order_number = cr.cr_order_number and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 208 and cs.cs_hash <= 541 and c.c_hash >= 13 and c.c_hash <= 763 and a.ca_hash >= 461 and a.ca_hash <= 861
;
