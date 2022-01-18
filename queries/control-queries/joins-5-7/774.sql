select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 457 and ss.ss_hash <= 857 and hd.hd_hash >= 157 and hd.hd_hash <= 907 and a.ca_hash >= 610 and a.ca_hash <= 943
;
