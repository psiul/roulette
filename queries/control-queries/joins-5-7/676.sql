select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 27 and c.c_hash <= 777 and hd.hd_hash >= 653 and hd.hd_hash <= 986 and a.ca_hash >= 429 and a.ca_hash <= 829
;
