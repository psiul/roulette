select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and a.ca_hash >= 504 and a.ca_hash <= 904 and hd.hd_hash >= 27 and hd.hd_hash <= 777 and i.i_hash >= 139 and i.i_hash <= 472
;
