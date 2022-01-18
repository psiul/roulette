select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 244 and c.c_hash <= 577 and cd.cd_hash >= 22 and cd.cd_hash <= 422 and a.ca_hash >= 224 and a.ca_hash <= 974
;
