select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 475 and ss.ss_hash <= 875 and i.i_hash >= 548 and i.i_hash <= 881 and hd.hd_hash >= 18 and hd.hd_hash <= 768
;
