select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 221 and ss.ss_hash <= 271 and c.c_hash >= 566 and c.c_hash <= 586 and cd.cd_hash >= 90 and cd.cd_hash <= 190
;
