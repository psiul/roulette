select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 368 and ss.ss_hash <= 768 and hd.hd_hash >= 56 and hd.hd_hash <= 389 and c.c_hash >= 74 and c.c_hash <= 824
;
