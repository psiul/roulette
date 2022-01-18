select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 1 and cd.cd_hash <= 751 and i.i_hash >= 210 and i.i_hash <= 610 and a.ca_hash >= 37 and a.ca_hash <= 370
;
