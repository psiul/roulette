select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 612 and ss.ss_hash <= 812 and c.c_hash >= 818 and c.c_hash <= 918 and hd.hd_hash >= 336 and hd.hd_hash <= 386
;
