select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 426 and ss.ss_hash <= 826 and hd.hd_hash >= 53 and hd.hd_hash <= 803 and i.i_hash >= 653 and i.i_hash <= 986
;
