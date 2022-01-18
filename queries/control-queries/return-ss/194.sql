select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 13 and cd.cd_hash <= 763 and i.i_hash >= 637 and i.i_hash <= 970 and a.ca_hash >= 382 and a.ca_hash <= 782
;
