select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 53 and ss.ss_hash <= 386 and i.i_hash >= 240 and i.i_hash <= 990 and c.c_hash >= 479 and c.c_hash <= 879
;
