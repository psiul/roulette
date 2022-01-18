select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 691 and ss.ss_hash <= 891 and i.i_hash >= 605 and i.i_hash <= 655 and cd.cd_hash >= 135 and cd.cd_hash <= 235
;
