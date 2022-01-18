select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 253 and ss.ss_hash <= 653 and hd.hd_hash >= 432 and hd.hd_hash <= 765 and c.c_hash >= 234 and c.c_hash <= 984
;
