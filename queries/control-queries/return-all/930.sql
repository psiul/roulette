select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 449 and cd.cd_hash <= 849 and c.c_hash >= 379 and c.c_hash <= 712 and i.i_hash >= 117 and i.i_hash <= 867
;
