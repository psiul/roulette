select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 7 and ss.ss_hash <= 407 and a.ca_hash >= 184 and a.ca_hash <= 934 and cd.cd_hash >= 380 and cd.cd_hash <= 713
;
