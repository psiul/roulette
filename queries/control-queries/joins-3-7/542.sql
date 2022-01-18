select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 242 and ss.ss_hash <= 992 and hd.hd_hash >= 318 and hd.hd_hash <= 718 and i.i_hash >= 263 and i.i_hash <= 596
;
