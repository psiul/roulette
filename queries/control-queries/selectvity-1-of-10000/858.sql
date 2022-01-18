select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 834 and ss.ss_hash <= 934 and cd.cd_hash >= 81 and cd.cd_hash <= 131 and i.i_hash >= 16 and i.i_hash <= 36
;
