select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_hash >= 166 and c.c_hash <= 916 and hd.hd_hash >= 56 and hd.hd_hash <= 389 and a.ca_hash >= 122 and a.ca_hash <= 522
;
