select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 120 and ss.ss_hash <= 520 and cd.cd_hash >= 4 and cd.cd_hash <= 754 and c.c_hash >= 151 and c.c_hash <= 484
;
