select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and a.ca_hash >= 194 and a.ca_hash <= 244 and hd.hd_hash >= 207 and hd.hd_hash <= 307 and cd.cd_hash >= 202 and cd.cd_hash <= 402
;
