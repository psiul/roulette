select count(cs.cs_item_sk)
from catalog_sales cs,date_dim d,customer c,customer_address a,household_demographics hd
where cs.cs_ship_date_sk = d.d_date_sk and cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 6 and cs.cs_hash <= 756 and d.d_hash >= 499 and d.d_hash <= 899 and c.c_hash >= 415 and c.c_hash <= 748
;
