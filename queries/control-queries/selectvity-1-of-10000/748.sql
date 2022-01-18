select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 765 and cd.cd_hash <= 865 and c.c_hash >= 520 and c.c_hash <= 540 and hd.hd_hash >= 19 and hd.hd_hash <= 69
;
