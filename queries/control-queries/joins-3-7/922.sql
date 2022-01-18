select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 300 and ss.ss_hash <= 700 and hd.hd_hash >= 503 and hd.hd_hash <= 836 and i.i_hash >= 180 and i.i_hash <= 930
;
