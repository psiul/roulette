select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 475 and ss.ss_hash <= 575 and hd.hd_hash >= 649 and hd.hd_hash <= 669 and c.c_hash >= 167 and c.c_hash <= 217
;
