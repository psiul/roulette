select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 47 and ss.ss_hash <= 380 and i.i_hash >= 263 and i.i_hash <= 663 and c.c_hash >= 167 and c.c_hash <= 917
;
