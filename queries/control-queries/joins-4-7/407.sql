select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 499 and ss.ss_hash <= 899 and cd.cd_hash >= 145 and cd.cd_hash <= 478 and c.c_hash >= 180 and c.c_hash <= 930
;
