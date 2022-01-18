select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 211 and ss.ss_hash <= 961 and hd.hd_hash >= 64 and hd.hd_hash <= 397 and a.ca_hash >= 473 and a.ca_hash <= 873
;
