select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 205 and ss.ss_hash <= 705 and c.c_hash >= 523 and c.c_hash <= 723 and cd.cd_hash >= 827 and cd.cd_hash <= 927
;
