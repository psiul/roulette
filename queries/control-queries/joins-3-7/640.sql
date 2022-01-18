select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 145 and ss.ss_hash <= 545 and hd.hd_hash >= 557 and hd.hd_hash <= 890 and i.i_hash >= 133 and i.i_hash <= 883
;
