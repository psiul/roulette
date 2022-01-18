select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 154 and c.c_hash <= 554 and i.i_hash >= 199 and i.i_hash <= 532 and a.ca_hash >= 93 and a.ca_hash <= 843
;
