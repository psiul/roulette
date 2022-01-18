select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 202 and cd.cd_hash <= 952 and hd.hd_hash >= 328 and hd.hd_hash <= 661 and a.ca_hash >= 214 and a.ca_hash <= 614
;
