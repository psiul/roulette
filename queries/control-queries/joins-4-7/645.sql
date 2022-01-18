select count(ss.ss_item_sk)
from store_sales ss,customer c,household_demographics hd,item i
where ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 122 and ss.ss_hash <= 872 and c.c_hash >= 585 and c.c_hash <= 985 and hd.hd_hash >= 516 and hd.hd_hash <= 849
;
