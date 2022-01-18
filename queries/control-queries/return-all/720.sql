select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,household_demographics hd,date_dim d
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_hash >= 478 and c.c_hash <= 878 and hd.hd_hash >= 429 and hd.hd_hash <= 762 and d.d_hash >= 113 and d.d_hash <= 863
;
