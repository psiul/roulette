select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and a.ca_hash >= 440 and a.ca_hash <= 640 and hd.hd_hash >= 239 and hd.hd_hash <= 739 and cd.cd_hash >= 420 and cd.cd_hash <= 520
;
