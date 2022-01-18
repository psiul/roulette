select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 851 and ss.ss_hash <= 951 and cd.cd_hash >= 252 and cd.cd_hash <= 302 and i.i_hash >= 69 and i.i_hash <= 89
;
