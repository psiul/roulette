select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 569 and i.i_hash <= 902 and c.c_hash >= 18 and c.c_hash <= 768 and hd.hd_hash >= 251 and hd.hd_hash <= 651
;
