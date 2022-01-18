select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 205 and ss.ss_hash <= 955 and hd.hd_hash >= 489 and hd.hd_hash <= 889 and i.i_hash >= 39 and i.i_hash <= 372
;
