select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 22 and ss.ss_hash <= 422 and hd.hd_hash >= 594 and hd.hd_hash <= 927 and i.i_hash >= 242 and i.i_hash <= 992
;
