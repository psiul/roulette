select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 571 and ss.ss_hash <= 971 and hd.hd_hash >= 18 and hd.hd_hash <= 351 and i.i_hash >= 44 and i.i_hash <= 794
;
