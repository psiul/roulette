select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 526 and ss.ss_hash <= 626 and c.c_hash >= 809 and c.c_hash <= 859 and i.i_hash >= 414 and i.i_hash <= 434
;
