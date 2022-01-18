select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,customer_address a
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 189 and ss.ss_hash <= 939 and i.i_hash >= 7 and i.i_hash <= 407 and cd.cd_hash >= 491 and cd.cd_hash <= 824
;
