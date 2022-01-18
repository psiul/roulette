select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 154 and ss.ss_hash <= 487 and i.i_hash >= 571 and i.i_hash <= 971 and hd.hd_hash >= 244 and hd.hd_hash <= 994
;
