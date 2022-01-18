select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 97 and ss.ss_hash <= 497 and i.i_hash >= 577 and i.i_hash <= 910 and cd.cd_hash >= 166 and cd.cd_hash <= 916
;