select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 135 and cd.cd_hash <= 535 and c.c_hash >= 38 and c.c_hash <= 788 and hd.hd_hash >= 322 and hd.hd_hash <= 655
;
