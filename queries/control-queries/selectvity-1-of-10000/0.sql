select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 617 and ss.ss_hash <= 717 and c.c_hash >= 136 and c.c_hash <= 156 and hd.hd_hash >= 285 and hd.hd_hash <= 335
;
