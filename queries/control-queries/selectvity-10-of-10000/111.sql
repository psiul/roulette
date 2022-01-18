select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 124 and ss.ss_hash <= 324 and hd.hd_hash >= 305 and hd.hd_hash <= 405 and c.c_hash >= 778 and c.c_hash <= 828
;
