select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 467 and c.c_hash <= 867 and a.ca_hash >= 186 and a.ca_hash <= 519 and hd.hd_hash >= 242 and hd.hd_hash <= 992
;
