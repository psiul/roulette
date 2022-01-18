select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 264 and ss.ss_hash <= 597 and i.i_hash >= 329 and i.i_hash <= 729 and a.ca_hash >= 193 and a.ca_hash <= 943
;
