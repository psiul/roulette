select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 289 and cd.cd_hash <= 689 and hd.hd_hash >= 163 and hd.hd_hash <= 913 and c.c_hash >= 661 and c.c_hash <= 994
;
