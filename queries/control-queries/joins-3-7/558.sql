select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 208 and ss.ss_hash <= 958 and hd.hd_hash >= 171 and hd.hd_hash <= 504 and i.i_hash >= 160 and i.i_hash <= 560
;
