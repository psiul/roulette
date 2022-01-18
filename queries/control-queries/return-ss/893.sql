select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 612 and ss.ss_hash <= 945 and c.c_hash >= 118 and c.c_hash <= 868 and cd.cd_hash >= 349 and cd.cd_hash <= 749
;
