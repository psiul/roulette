select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 5 and ss.ss_hash <= 55 and c.c_hash >= 559 and c.c_hash <= 659 and a.ca_hash >= 623 and a.ca_hash <= 823
;
