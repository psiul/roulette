select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and c.c_current_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 448 and ss.ss_hash <= 781 and i.i_hash >= 169 and i.i_hash <= 919 and hd.hd_hash >= 510 and hd.hd_hash <= 910
;
