select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 226 and ss.ss_hash <= 976 and hd.hd_hash >= 194 and hd.hd_hash <= 527 and cd.cd_hash >= 541 and cd.cd_hash <= 941
;
