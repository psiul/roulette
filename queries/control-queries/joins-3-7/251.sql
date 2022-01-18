select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 203 and ss.ss_hash <= 536 and hd.hd_hash >= 175 and hd.hd_hash <= 575 and i.i_hash >= 10 and i.i_hash <= 760
;
