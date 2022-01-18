select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 133 and ss.ss_hash <= 466 and i.i_hash >= 185 and i.i_hash <= 585 and hd.hd_hash >= 88 and hd.hd_hash <= 838
;
