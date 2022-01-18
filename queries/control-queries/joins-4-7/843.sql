select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 76 and c.c_hash <= 409 and cd.cd_hash >= 146 and cd.cd_hash <= 896 and a.ca_hash >= 298 and a.ca_hash <= 698
;
