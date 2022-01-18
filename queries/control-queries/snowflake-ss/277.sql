select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 409 and ss.ss_hash <= 742 and c.c_hash >= 74 and c.c_hash <= 474 and cd.cd_hash >= 235 and cd.cd_hash <= 985
;
