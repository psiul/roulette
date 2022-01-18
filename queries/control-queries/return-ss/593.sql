select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 104 and ss.ss_hash <= 854 and i.i_hash >= 93 and i.i_hash <= 493 and c.c_hash >= 3 and c.c_hash <= 336
;
