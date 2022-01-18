select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 131 and ss.ss_hash <= 231 and i.i_hash >= 4 and i.i_hash <= 204 and a.ca_hash >= 366 and a.ca_hash <= 866
;
