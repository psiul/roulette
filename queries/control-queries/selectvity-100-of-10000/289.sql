select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,customer_address a
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_hash >= 785 and ss.ss_hash <= 885 and c.c_hash >= 177 and c.c_hash <= 677 and hd.hd_hash >= 531 and hd.hd_hash <= 731
;
