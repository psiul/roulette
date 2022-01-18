select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and hd.hd_hash >= 142 and hd.hd_hash <= 162 and i.i_hash >= 388 and i.i_hash <= 488 and c.c_hash >= 291 and c.c_hash <= 341
;
