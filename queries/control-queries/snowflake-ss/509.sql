select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 219 and ss.ss_hash <= 619 and cd.cd_hash >= 47 and cd.cd_hash <= 380 and hd.hd_hash >= 228 and hd.hd_hash <= 978
;
