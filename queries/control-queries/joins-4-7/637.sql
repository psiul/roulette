select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 92 and c.c_hash <= 842 and a.ca_hash >= 449 and a.ca_hash <= 849 and cd.cd_hash >= 2 and cd.cd_hash <= 335
;
