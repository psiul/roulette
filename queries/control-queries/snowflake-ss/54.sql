select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 500 and ss.ss_hash <= 833 and a.ca_hash >= 64 and a.ca_hash <= 814 and cd.cd_hash >= 590 and cd.cd_hash <= 990
;
