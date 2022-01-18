select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 144 and cd.cd_hash <= 544 and c.c_hash >= 539 and c.c_hash <= 872 and hd.hd_hash >= 121 and hd.hd_hash <= 871
;
