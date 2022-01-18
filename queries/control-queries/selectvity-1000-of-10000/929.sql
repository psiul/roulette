select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 8 and ss.ss_hash <= 758 and hd.hd_hash >= 654 and hd.hd_hash <= 987 and cd.cd_hash >= 171 and cd.cd_hash <= 571
;
