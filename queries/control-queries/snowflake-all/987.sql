select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 232 and ss.ss_hash <= 565 and c.c_hash >= 515 and c.c_hash <= 915 and i.i_hash >= 112 and i.i_hash <= 862
;
