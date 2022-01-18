select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 649 and ss.ss_hash <= 982 and i.i_hash >= 197 and i.i_hash <= 947 and hd.hd_hash >= 501 and hd.hd_hash <= 901
;
