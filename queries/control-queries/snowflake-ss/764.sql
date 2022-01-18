select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 303 and ss.ss_hash <= 636 and c.c_hash >= 126 and c.c_hash <= 876 and a.ca_hash >= 555 and a.ca_hash <= 955
;
