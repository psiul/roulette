select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 171 and i.i_hash <= 921 and hd.hd_hash >= 320 and hd.hd_hash <= 720 and c.c_hash >= 626 and c.c_hash <= 959
;
