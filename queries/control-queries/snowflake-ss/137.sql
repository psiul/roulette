select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,customer_address a,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_hash >= 445 and c.c_hash <= 778 and a.ca_hash >= 12 and a.ca_hash <= 762 and hd.hd_hash >= 82 and hd.hd_hash <= 482
;
