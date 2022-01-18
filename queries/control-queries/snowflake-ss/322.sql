select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 56 and ss.ss_hash <= 456 and a.ca_hash >= 192 and a.ca_hash <= 942 and i.i_hash >= 208 and i.i_hash <= 541
;
