select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,item i,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 530 and ss.ss_hash <= 580 and c.c_hash >= 617 and c.c_hash <= 717 and a.ca_hash >= 45 and a.ca_hash <= 65
;
