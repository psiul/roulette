select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 398 and i.i_hash <= 731 and c.c_hash >= 215 and c.c_hash <= 615 and cd.cd_hash >= 42 and cd.cd_hash <= 792
;
