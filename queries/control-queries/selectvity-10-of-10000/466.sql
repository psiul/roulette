select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 32 and ss.ss_hash <= 132 and c.c_hash >= 865 and c.c_hash <= 915 and a.ca_hash >= 721 and a.ca_hash <= 921
;
