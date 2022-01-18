select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 157 and ss.ss_hash <= 907 and hd.hd_hash >= 87 and hd.hd_hash <= 487 and i.i_hash >= 450 and i.i_hash <= 783
;
