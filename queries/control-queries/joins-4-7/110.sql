select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 594 and hd.hd_hash <= 994 and d.d_hash >= 240 and d.d_hash <= 990 and i.i_hash >= 630 and i.i_hash <= 963
;
