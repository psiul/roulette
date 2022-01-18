select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 554 and ss.ss_hash <= 954 and i.i_hash >= 240 and i.i_hash <= 573 and c.c_hash >= 38 and c.c_hash <= 788
;
