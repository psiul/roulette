select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 206 and ss.ss_hash <= 956 and c.c_hash >= 537 and c.c_hash <= 937 and a.ca_hash >= 37 and a.ca_hash <= 370
;
