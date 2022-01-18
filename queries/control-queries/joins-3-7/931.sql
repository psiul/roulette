select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 216 and ss.ss_hash <= 966 and i.i_hash >= 205 and i.i_hash <= 605 and hd.hd_hash >= 598 and hd.hd_hash <= 931
;
