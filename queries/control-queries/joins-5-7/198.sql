select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 368 and ss.ss_hash <= 768 and cd.cd_hash >= 357 and cd.cd_hash <= 690 and a.ca_hash >= 244 and a.ca_hash <= 994
;
