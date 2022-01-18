select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 457 and ss.ss_hash <= 790 and hd.hd_hash >= 75 and hd.hd_hash <= 825 and i.i_hash >= 16 and i.i_hash <= 416
;
