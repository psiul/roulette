select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and c.c_hash >= 192 and c.c_hash <= 525 and hd.hd_hash >= 7 and hd.hd_hash <= 757 and i.i_hash >= 173 and i.i_hash <= 573
;
