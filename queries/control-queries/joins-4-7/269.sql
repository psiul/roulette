select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 123 and ss.ss_hash <= 873 and hd.hd_hash >= 485 and hd.hd_hash <= 818 and c.c_hash >= 459 and c.c_hash <= 859
;
