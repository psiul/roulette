select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and i.i_hash >= 108 and i.i_hash <= 858 and c.c_hash >= 298 and c.c_hash <= 698 and a.ca_hash >= 90 and a.ca_hash <= 423
;
