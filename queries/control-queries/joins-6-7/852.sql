select count(ss.ss_item_sk)
from store_sales ss,customer c,customer_demographics cd,household_demographics hd,customer_address a,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 149 and ss.ss_hash <= 899 and hd.hd_hash >= 379 and hd.hd_hash <= 779 and a.ca_hash >= 531 and a.ca_hash <= 864
;
