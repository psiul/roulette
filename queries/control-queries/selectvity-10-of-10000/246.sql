select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 271 and ss.ss_hash <= 321 and i.i_hash >= 24 and i.i_hash <= 124 and c.c_hash >= 554 and c.c_hash <= 754
;
