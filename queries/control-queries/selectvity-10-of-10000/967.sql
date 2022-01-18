select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 330 and ss.ss_hash <= 380 and c.c_hash >= 818 and c.c_hash <= 918 and a.ca_hash >= 7 and a.ca_hash <= 207
;