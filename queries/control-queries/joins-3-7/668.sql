select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 12 and ss.ss_hash <= 762 and i.i_hash >= 218 and i.i_hash <= 618 and hd.hd_hash >= 99 and hd.hd_hash <= 432
;
