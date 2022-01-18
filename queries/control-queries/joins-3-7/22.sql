select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 441 and ss.ss_hash <= 841 and hd.hd_hash >= 88 and hd.hd_hash <= 838 and i.i_hash >= 77 and i.i_hash <= 410
;
