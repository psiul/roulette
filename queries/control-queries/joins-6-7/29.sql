select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c,customer_address a,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 178 and ss.ss_hash <= 928 and i.i_hash >= 280 and i.i_hash <= 613 and a.ca_hash >= 125 and a.ca_hash <= 525
;
