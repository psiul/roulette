select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,customer_address a,date_dim d
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_ship_date_sk = d.d_date_sk and hd.hd_hash >= 105 and hd.hd_hash <= 505 and c.c_hash >= 251 and c.c_hash <= 584 and d.d_hash >= 126 and d.d_hash <= 876
;
