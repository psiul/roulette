select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 535 and cd.cd_hash <= 935 and c.c_hash >= 510 and c.c_hash <= 843 and hd.hd_hash >= 65 and hd.hd_hash <= 815
;
