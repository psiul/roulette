select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 471 and ss.ss_hash <= 871 and hd.hd_hash >= 179 and hd.hd_hash <= 929 and i.i_hash >= 80 and i.i_hash <= 413
;
