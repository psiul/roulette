select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 133 and ss.ss_hash <= 883 and i.i_hash >= 485 and i.i_hash <= 885 and c.c_hash >= 107 and c.c_hash <= 440
;
