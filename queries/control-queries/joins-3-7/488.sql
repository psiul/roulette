select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 223 and ss.ss_hash <= 973 and hd.hd_hash >= 124 and hd.hd_hash <= 457 and i.i_hash >= 228 and i.i_hash <= 628
;
