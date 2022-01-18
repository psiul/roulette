select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 281 and ss.ss_hash <= 481 and hd.hd_hash >= 463 and hd.hd_hash <= 963 and c.c_hash >= 583 and c.c_hash <= 683
;
