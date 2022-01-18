select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 190 and ss.ss_hash <= 940 and c.c_hash >= 101 and c.c_hash <= 501 and a.ca_hash >= 184 and a.ca_hash <= 517
;
