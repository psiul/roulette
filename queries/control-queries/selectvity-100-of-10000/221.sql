select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 75 and c.c_hash <= 175 and cd.cd_hash >= 262 and cd.cd_hash <= 462 and i.i_hash >= 332 and i.i_hash <= 832
;
