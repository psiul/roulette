select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 398 and ss.ss_hash <= 898 and cd.cd_hash >= 704 and cd.cd_hash <= 904 and i.i_hash >= 426 and i.i_hash <= 526
;
