select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 595 and cd.cd_hash <= 645 and c.c_hash >= 381 and c.c_hash <= 401 and i.i_hash >= 2 and i.i_hash <= 102
;
