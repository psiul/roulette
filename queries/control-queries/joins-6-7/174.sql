select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,customer_address a,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_addr_sk = a.ca_address_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 277 and ss.ss_hash <= 610 and i.i_hash >= 240 and i.i_hash <= 990 and cd.cd_hash >= 235 and cd.cd_hash <= 635
;
