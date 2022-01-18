select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,customer c,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and cd.cd_hash >= 429 and cd.cd_hash <= 762 and hd.hd_hash >= 554 and hd.hd_hash <= 954 and a.ca_hash >= 5 and a.ca_hash <= 755
;
