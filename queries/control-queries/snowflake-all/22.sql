select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 7 and ss.ss_hash <= 407 and a.ca_hash >= 463 and a.ca_hash <= 796 and cd.cd_hash >= 89 and cd.cd_hash <= 839
;
