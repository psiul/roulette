select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 875 and cd.cd_hash <= 975 and a.ca_hash >= 26 and a.ca_hash <= 526 and hd.hd_hash >= 720 and hd.hd_hash <= 920
;
