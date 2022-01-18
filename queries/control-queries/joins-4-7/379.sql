select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 130 and ss.ss_hash <= 880 and c.c_hash >= 363 and c.c_hash <= 696 and a.ca_hash >= 175 and a.ca_hash <= 575
;
