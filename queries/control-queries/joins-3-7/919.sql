select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 41 and ss.ss_hash <= 374 and i.i_hash >= 474 and i.i_hash <= 874 and hd.hd_hash >= 78 and hd.hd_hash <= 828
;
