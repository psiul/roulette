select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 519 and ss.ss_hash <= 919 and i.i_hash >= 187 and i.i_hash <= 520 and hd.hd_hash >= 128 and hd.hd_hash <= 878
;
