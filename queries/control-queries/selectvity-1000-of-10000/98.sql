select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 138 and ss.ss_hash <= 471 and hd.hd_hash >= 133 and hd.hd_hash <= 883 and a.ca_hash >= 218 and a.ca_hash <= 618
;
