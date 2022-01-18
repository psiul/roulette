select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 275 and i.i_hash <= 608 and cd.cd_hash >= 573 and cd.cd_hash <= 973 and c.c_hash >= 98 and c.c_hash <= 848
;