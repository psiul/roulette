select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 646 and c.c_hash <= 979 and a.ca_hash >= 37 and a.ca_hash <= 787 and i.i_hash >= 416 and i.i_hash <= 816
;
