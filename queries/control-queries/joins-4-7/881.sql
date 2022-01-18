select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 223 and ss.ss_hash <= 623 and hd.hd_hash >= 24 and hd.hd_hash <= 774 and i.i_hash >= 348 and i.i_hash <= 681
;
