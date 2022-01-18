select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 428 and c.c_hash <= 478 and i.i_hash >= 739 and i.i_hash <= 759 and cd.cd_hash >= 242 and cd.cd_hash <= 342
;
