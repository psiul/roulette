select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 550 and ss.ss_hash <= 950 and hd.hd_hash >= 130 and hd.hd_hash <= 880 and i.i_hash >= 463 and i.i_hash <= 796
;
