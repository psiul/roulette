select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 86 and ss.ss_hash <= 836 and hd.hd_hash >= 54 and hd.hd_hash <= 454 and a.ca_hash >= 27 and a.ca_hash <= 360
;
