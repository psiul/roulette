select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 441 and ss.ss_hash <= 641 and c.c_hash >= 406 and c.c_hash <= 506 and hd.hd_hash >= 387 and hd.hd_hash <= 437
;
