select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_address a,household_demographics hd,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and c.c_hash >= 301 and c.c_hash <= 801 and a.ca_hash >= 56 and a.ca_hash <= 256 and hd.hd_hash >= 652 and hd.hd_hash <= 752
;
