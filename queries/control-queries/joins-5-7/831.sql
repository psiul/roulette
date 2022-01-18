select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 66 and i.i_hash <= 399 and c.c_hash >= 134 and c.c_hash <= 884 and a.ca_hash >= 513 and a.ca_hash <= 913
;