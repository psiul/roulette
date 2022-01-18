select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 67 and ss.ss_hash <= 167 and cd.cd_hash >= 19 and cd.cd_hash <= 69 and hd.hd_hash >= 244 and hd.hd_hash <= 264
;
