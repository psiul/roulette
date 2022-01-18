select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 463 and ss.ss_hash <= 513 and c.c_hash >= 495 and c.c_hash <= 695 and a.ca_hash >= 889 and a.ca_hash <= 989
;
