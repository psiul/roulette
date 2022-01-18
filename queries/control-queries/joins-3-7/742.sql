select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 162 and ss.ss_hash <= 912 and hd.hd_hash >= 43 and hd.hd_hash <= 443 and i.i_hash >= 106 and i.i_hash <= 439
;
