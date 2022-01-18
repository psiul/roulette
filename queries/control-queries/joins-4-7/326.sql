select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 432 and ss.ss_hash <= 832 and c.c_hash >= 157 and c.c_hash <= 907 and i.i_hash >= 82 and i.i_hash <= 415
;
