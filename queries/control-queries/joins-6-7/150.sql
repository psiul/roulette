select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,item i,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 121 and ss.ss_hash <= 871 and a.ca_hash >= 486 and a.ca_hash <= 886 and hd.hd_hash >= 415 and hd.hd_hash <= 748
;
