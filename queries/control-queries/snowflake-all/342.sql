select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 202 and c.c_hash <= 952 and i.i_hash >= 209 and i.i_hash <= 542 and a.ca_hash >= 314 and a.ca_hash <= 714
;
