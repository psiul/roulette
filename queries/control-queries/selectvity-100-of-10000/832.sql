select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 51 and i.i_hash <= 551 and c.c_hash >= 554 and c.c_hash <= 654 and hd.hd_hash >= 503 and hd.hd_hash <= 703
;
