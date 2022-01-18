select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 169 and ss.ss_hash <= 919 and hd.hd_hash >= 330 and hd.hd_hash <= 730 and i.i_hash >= 519 and i.i_hash <= 852
;
