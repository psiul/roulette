select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 268 and c.c_hash <= 468 and a.ca_hash >= 91 and a.ca_hash <= 191 and i.i_hash >= 308 and i.i_hash <= 808
;
