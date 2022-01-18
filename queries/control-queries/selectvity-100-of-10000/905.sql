select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 55 and ss.ss_hash <= 255 and a.ca_hash >= 360 and a.ca_hash <= 860 and cd.cd_hash >= 304 and cd.cd_hash <= 404
;
