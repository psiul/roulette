select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 105 and ss.ss_hash <= 855 and i.i_hash >= 169 and i.i_hash <= 502 and hd.hd_hash >= 52 and hd.hd_hash <= 452
;
