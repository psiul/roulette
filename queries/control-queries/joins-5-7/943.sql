select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_demographics cd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 103 and ss.ss_hash <= 853 and c.c_hash >= 633 and c.c_hash <= 966 and hd.hd_hash >= 34 and hd.hd_hash <= 434
;
