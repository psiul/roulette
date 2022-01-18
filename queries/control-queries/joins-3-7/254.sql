select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 24 and ss.ss_hash <= 774 and hd.hd_hash >= 470 and hd.hd_hash <= 803 and i.i_hash >= 220 and i.i_hash <= 620
;
