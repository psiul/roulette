select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 135 and ss.ss_hash <= 885 and hd.hd_hash >= 481 and hd.hd_hash <= 814 and i.i_hash >= 327 and i.i_hash <= 727
;
