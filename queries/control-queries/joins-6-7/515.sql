select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 15 and i.i_hash <= 765 and c.c_hash >= 22 and c.c_hash <= 355 and a.ca_hash >= 174 and a.ca_hash <= 574
;
