select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 193 and ss.ss_hash <= 593 and cd.cd_hash >= 69 and cd.cd_hash <= 402 and a.ca_hash >= 140 and a.ca_hash <= 890
;
