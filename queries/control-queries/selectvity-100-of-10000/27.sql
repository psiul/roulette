select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 296 and ss.ss_hash <= 496 and i.i_hash >= 824 and i.i_hash <= 924 and a.ca_hash >= 369 and a.ca_hash <= 869
;
