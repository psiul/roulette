select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 438 and c.c_hash <= 771 and a.ca_hash >= 51 and a.ca_hash <= 451 and cd.cd_hash >= 174 and cd.cd_hash <= 924
;
