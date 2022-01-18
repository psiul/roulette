select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 297 and c.c_hash <= 697 and i.i_hash >= 80 and i.i_hash <= 413 and hd.hd_hash >= 57 and hd.hd_hash <= 807
;
