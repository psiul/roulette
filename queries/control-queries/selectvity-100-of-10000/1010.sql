select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 338 and ss.ss_hash <= 838 and hd.hd_hash >= 265 and hd.hd_hash <= 365 and cd.cd_hash >= 192 and cd.cd_hash <= 392
;
