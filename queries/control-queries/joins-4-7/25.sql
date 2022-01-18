select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer c,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 611 and ss.ss_hash <= 944 and hd.hd_hash >= 150 and hd.hd_hash <= 900 and c.c_hash >= 559 and c.c_hash <= 959
;
