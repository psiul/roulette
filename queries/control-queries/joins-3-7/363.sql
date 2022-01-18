select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 147 and ss.ss_hash <= 897 and hd.hd_hash >= 405 and hd.hd_hash <= 805 and i.i_hash >= 499 and i.i_hash <= 832
;
