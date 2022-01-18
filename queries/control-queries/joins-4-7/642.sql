select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 176 and ss.ss_hash <= 509 and a.ca_hash >= 239 and a.ca_hash <= 989 and cd.cd_hash >= 552 and cd.cd_hash <= 952
;
