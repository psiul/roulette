select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,customer_address a,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 457 and hd.hd_hash <= 790 and a.ca_hash >= 64 and a.ca_hash <= 814 and i.i_hash >= 591 and i.i_hash <= 991
;
