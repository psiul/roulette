select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 159 and ss.ss_hash <= 492 and i.i_hash >= 132 and i.i_hash <= 882 and hd.hd_hash >= 571 and hd.hd_hash <= 971
;
