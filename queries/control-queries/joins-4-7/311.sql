select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 100 and ss.ss_hash <= 500 and i.i_hash >= 40 and i.i_hash <= 790 and c.c_hash >= 232 and c.c_hash <= 565
;
