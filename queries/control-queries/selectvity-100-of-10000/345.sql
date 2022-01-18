select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 259 and ss.ss_hash <= 359 and hd.hd_hash >= 480 and hd.hd_hash <= 980 and c.c_hash >= 132 and c.c_hash <= 332
;
