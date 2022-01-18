select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 529 and ss.ss_hash <= 862 and hd.hd_hash >= 18 and hd.hd_hash <= 418 and cd.cd_hash >= 155 and cd.cd_hash <= 905
;
