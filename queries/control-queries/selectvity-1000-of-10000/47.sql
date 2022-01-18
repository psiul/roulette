select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 487 and ss.ss_hash <= 820 and i.i_hash >= 143 and i.i_hash <= 893 and a.ca_hash >= 154 and a.ca_hash <= 554
;
