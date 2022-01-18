select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 194 and i.i_hash <= 594 and hd.hd_hash >= 193 and hd.hd_hash <= 526 and d.d_hash >= 41 and d.d_hash <= 791
;
