select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,customer_address a,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 151 and ss.ss_hash <= 551 and cd.cd_hash >= 53 and cd.cd_hash <= 803 and a.ca_hash >= 195 and a.ca_hash <= 528
;
