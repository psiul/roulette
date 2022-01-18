select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 422 and ss.ss_hash <= 822 and hd.hd_hash >= 312 and hd.hd_hash <= 645 and i.i_hash >= 184 and i.i_hash <= 934
;
