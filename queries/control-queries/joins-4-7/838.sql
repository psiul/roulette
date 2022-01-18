select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 499 and ss.ss_hash <= 832 and c.c_hash >= 532 and c.c_hash <= 932 and a.ca_hash >= 57 and a.ca_hash <= 807
;
