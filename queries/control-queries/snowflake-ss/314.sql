select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 0 and ss.ss_hash <= 750 and i.i_hash >= 537 and i.i_hash <= 870 and hd.hd_hash >= 394 and hd.hd_hash <= 794
;
