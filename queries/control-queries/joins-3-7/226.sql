select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 485 and ss.ss_hash <= 818 and i.i_hash >= 144 and i.i_hash <= 894 and hd.hd_hash >= 193 and hd.hd_hash <= 593
;
