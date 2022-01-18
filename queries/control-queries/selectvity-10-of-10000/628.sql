select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 150 and c.c_hash <= 250 and a.ca_hash >= 264 and a.ca_hash <= 464 and cd.cd_hash >= 270 and cd.cd_hash <= 320
;
