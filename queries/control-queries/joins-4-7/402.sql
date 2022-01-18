select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 240 and ss.ss_hash <= 990 and a.ca_hash >= 225 and a.ca_hash <= 625 and cd.cd_hash >= 214 and cd.cd_hash <= 547
;
