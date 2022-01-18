select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 790 and i.i_hash <= 840 and c.c_hash >= 199 and c.c_hash <= 299 and cd.cd_hash >= 765 and cd.cd_hash <= 965
;
