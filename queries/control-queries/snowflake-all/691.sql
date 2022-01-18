select count(cs.cs_item_sk)
from catalog_sales cs,household_demographics hd,customer c,date_dim d,customer_address a
where cs.cs_bill_hdemo_sk = hd.hd_demo_sk and cs.cs_bill_customer_sk = c.c_customer_sk and cs.cs_ship_date_sk = d.d_date_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_hash >= 214 and cs.cs_hash <= 964 and hd.hd_hash >= 97 and hd.hd_hash <= 430 and a.ca_hash >= 510 and a.ca_hash <= 910
;
