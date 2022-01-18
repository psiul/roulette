select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 118 and ss.ss_hash <= 868 and hd.hd_hash >= 6 and hd.hd_hash <= 406 and i.i_hash >= 442 and i.i_hash <= 775
;
