select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 352 and ss.ss_hash <= 752 and c.c_hash >= 66 and c.c_hash <= 816 and cd.cd_hash >= 168 and cd.cd_hash <= 501
;
