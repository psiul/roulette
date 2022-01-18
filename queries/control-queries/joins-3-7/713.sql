select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 590 and ss.ss_hash <= 990 and i.i_hash >= 42 and i.i_hash <= 792 and hd.hd_hash >= 545 and hd.hd_hash <= 878
;
