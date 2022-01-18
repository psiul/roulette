select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 661 and d.d_hash <= 994 and hd.hd_hash >= 25 and hd.hd_hash <= 775 and i.i_hash >= 281 and i.i_hash <= 681
;
