select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 222 and ss.ss_hash <= 622 and hd.hd_hash >= 238 and hd.hd_hash <= 571 and a.ca_hash >= 41 and a.ca_hash <= 791
;
