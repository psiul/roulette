select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 87 and ss.ss_hash <= 837 and hd.hd_hash >= 585 and hd.hd_hash <= 918 and i.i_hash >= 369 and i.i_hash <= 769
;
