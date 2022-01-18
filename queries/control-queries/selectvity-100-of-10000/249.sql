select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 450 and ss.ss_hash <= 550 and c.c_hash >= 57 and c.c_hash <= 557 and cd.cd_hash >= 797 and cd.cd_hash <= 997
;
