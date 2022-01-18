select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 206 and cd.cd_hash <= 606 and c.c_hash >= 256 and c.c_hash <= 589 and a.ca_hash >= 174 and a.ca_hash <= 924
;
