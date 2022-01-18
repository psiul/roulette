select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 94 and ss.ss_hash <= 844 and cd.cd_hash >= 567 and cd.cd_hash <= 967 and a.ca_hash >= 273 and a.ca_hash <= 606
;
