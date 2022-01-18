select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c,customer_address a,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 528 and i.i_hash <= 928 and c.c_hash >= 40 and c.c_hash <= 790 and a.ca_hash >= 408 and a.ca_hash <= 741
;
