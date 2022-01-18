select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 144 and ss.ss_hash <= 544 and i.i_hash >= 386 and i.i_hash <= 719 and hd.hd_hash >= 159 and hd.hd_hash <= 909
;
