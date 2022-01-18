select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 553 and ss.ss_hash <= 886 and i.i_hash >= 422 and i.i_hash <= 822 and hd.hd_hash >= 45 and hd.hd_hash <= 795
;
