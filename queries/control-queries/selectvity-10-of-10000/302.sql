select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 10 and ss.ss_hash <= 110 and hd.hd_hash >= 390 and hd.hd_hash <= 590 and cd.cd_hash >= 476 and cd.cd_hash <= 526
;
