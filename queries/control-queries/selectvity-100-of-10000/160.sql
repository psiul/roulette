select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 485 and i.i_hash <= 685 and c.c_hash >= 872 and c.c_hash <= 972 and a.ca_hash >= 373 and a.ca_hash <= 873
;
