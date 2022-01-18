select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 115 and ss.ss_hash <= 865 and hd.hd_hash >= 92 and hd.hd_hash <= 492 and i.i_hash >= 426 and i.i_hash <= 759
;
