select count(cs.cs_item_sk)
from catalog_sales cs,customer c,customer_address a,customer_demographics cd,household_demographics hd
where cs.cs_bill_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cs.cs_bill_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and cs.cs_hash >= 524 and cs.cs_hash <= 857 and c.c_hash >= 189 and c.c_hash <= 939 and a.ca_hash >= 313 and a.ca_hash <= 713
;
