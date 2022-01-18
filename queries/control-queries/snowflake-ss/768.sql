select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 510 and ss.ss_hash <= 843 and c.c_hash >= 200 and c.c_hash <= 950 and hd.hd_hash >= 371 and hd.hd_hash <= 771
;
