select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 50 and ss.ss_hash <= 800 and hd.hd_hash >= 68 and hd.hd_hash <= 468 and c.c_hash >= 218 and c.c_hash <= 551
;
