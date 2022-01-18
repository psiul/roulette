select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 82 and ss.ss_hash <= 832 and c.c_hash >= 13 and c.c_hash <= 413 and a.ca_hash >= 346 and a.ca_hash <= 679
;
