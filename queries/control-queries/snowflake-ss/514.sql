select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 259 and cd.cd_hash <= 592 and c.c_hash >= 72 and c.c_hash <= 822 and a.ca_hash >= 260 and a.ca_hash <= 660
;
