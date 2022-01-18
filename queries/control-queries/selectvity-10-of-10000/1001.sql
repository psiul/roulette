select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 483 and ss.ss_hash <= 533 and c.c_hash >= 722 and c.c_hash <= 922 and hd.hd_hash >= 81 and hd.hd_hash <= 181
;
