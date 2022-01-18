select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 162 and ss.ss_hash <= 912 and c.c_hash >= 245 and c.c_hash <= 578 and hd.hd_hash >= 545 and hd.hd_hash <= 945
;
