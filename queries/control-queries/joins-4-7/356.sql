select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 219 and ss.ss_hash <= 619 and hd.hd_hash >= 105 and hd.hd_hash <= 855 and i.i_hash >= 524 and i.i_hash <= 857
;
