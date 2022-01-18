select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 128 and ss.ss_hash <= 528 and c.c_hash >= 12 and c.c_hash <= 345 and a.ca_hash >= 58 and a.ca_hash <= 808
;
