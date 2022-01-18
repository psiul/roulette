select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 48 and i.i_hash <= 798 and c.c_hash >= 345 and c.c_hash <= 745 and hd.hd_hash >= 379 and hd.hd_hash <= 712
;
