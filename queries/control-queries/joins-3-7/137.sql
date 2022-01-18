select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 447 and ss.ss_hash <= 780 and hd.hd_hash >= 259 and hd.hd_hash <= 659 and i.i_hash >= 100 and i.i_hash <= 850
;
