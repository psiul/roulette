select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,customer_demographics cd,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 330 and ss.ss_hash <= 350 and a.ca_hash >= 634 and a.ca_hash <= 734 and hd.hd_hash >= 758 and hd.hd_hash <= 808
;
