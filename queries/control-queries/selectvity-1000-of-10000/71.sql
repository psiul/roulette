select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 286 and ss.ss_hash <= 686 and i.i_hash >= 78 and i.i_hash <= 828 and a.ca_hash >= 71 and a.ca_hash <= 404
;