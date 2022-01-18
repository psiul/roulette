select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 457 and ss.ss_hash <= 857 and i.i_hash >= 26 and i.i_hash <= 359 and hd.hd_hash >= 176 and hd.hd_hash <= 926
;
