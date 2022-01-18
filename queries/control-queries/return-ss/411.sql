select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 566 and ss.ss_hash <= 966 and hd.hd_hash >= 18 and hd.hd_hash <= 768 and cd.cd_hash >= 435 and cd.cd_hash <= 768
;
