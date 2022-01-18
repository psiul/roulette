select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 378 and ss.ss_hash <= 778 and c.c_hash >= 160 and c.c_hash <= 910 and cd.cd_hash >= 444 and cd.cd_hash <= 777
;
