select count(cs.cs_item_sk)
from catalog_sales cs,customer c,household_demographics hd,warehouse w,customer_address a
where cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_warehouse_sk = w.w_warehouse_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 221 and cs.cs_hash <= 971 and c.c_hash >= 195 and c.c_hash <= 595 and hd.hd_hash >= 323 and hd.hd_hash <= 656
;
