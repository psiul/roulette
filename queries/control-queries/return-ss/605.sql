select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 487 and ss.ss_hash <= 887 and i.i_hash >= 561 and i.i_hash <= 894 and cd.cd_hash >= 10 and cd.cd_hash <= 760
;
