select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 106 and ss.ss_hash <= 506 and cd.cd_hash >= 112 and cd.cd_hash <= 862 and i.i_hash >= 480 and i.i_hash <= 813
;
