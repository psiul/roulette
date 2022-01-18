select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_demographics cd,customer_address a
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and hd.hd_hash >= 38 and hd.hd_hash <= 788 and cd.cd_hash >= 396 and cd.cd_hash <= 729 and a.ca_hash >= 421 and a.ca_hash <= 821
;
