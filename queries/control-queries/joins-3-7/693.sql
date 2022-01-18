select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 337 and ss.ss_hash <= 737 and hd.hd_hash >= 0 and hd.hd_hash <= 750 and i.i_hash >= 268 and i.i_hash <= 601
;
