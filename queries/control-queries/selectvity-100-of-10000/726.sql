select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 329 and ss.ss_hash <= 529 and i.i_hash >= 592 and i.i_hash <= 692 and cd.cd_hash >= 157 and cd.cd_hash <= 657
;
