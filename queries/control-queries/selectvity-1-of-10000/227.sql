select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 908 and ss.ss_hash <= 928 and c.c_hash >= 700 and c.c_hash <= 800 and hd.hd_hash >= 661 and hd.hd_hash <= 711
;
