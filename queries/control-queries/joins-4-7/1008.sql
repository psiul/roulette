select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 604 and hd.hd_hash <= 937 and c.c_hash >= 240 and c.c_hash <= 990 and i.i_hash >= 410 and i.i_hash <= 810
;
