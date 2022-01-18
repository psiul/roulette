select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 446 and ss.ss_hash <= 846 and i.i_hash >= 171 and i.i_hash <= 921 and hd.hd_hash >= 581 and hd.hd_hash <= 914
;
