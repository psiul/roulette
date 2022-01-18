select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 520 and ss.ss_hash <= 570 and i.i_hash >= 202 and i.i_hash <= 302 and c.c_hash >= 58 and c.c_hash <= 258
;
