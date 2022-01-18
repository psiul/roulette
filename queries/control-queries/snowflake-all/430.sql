select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 466 and ss.ss_hash <= 866 and cd.cd_hash >= 128 and cd.cd_hash <= 461 and c.c_hash >= 63 and c.c_hash <= 813
;
