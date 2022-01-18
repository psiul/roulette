select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 395 and ss.ss_hash <= 795 and i.i_hash >= 193 and i.i_hash <= 943 and cd.cd_hash >= 435 and cd.cd_hash <= 768
;
