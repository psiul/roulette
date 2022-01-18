select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 150 and ss.ss_hash <= 550 and hd.hd_hash >= 3 and hd.hd_hash <= 753 and i.i_hash >= 480 and i.i_hash <= 813
;
