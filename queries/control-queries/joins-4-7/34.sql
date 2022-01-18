select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and cd.cd_hash >= 283 and cd.cd_hash <= 616 and c.c_hash >= 526 and c.c_hash <= 926
;
