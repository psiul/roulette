select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 430 and ss.ss_hash <= 763 and d.d_hash >= 177 and d.d_hash <= 927 and hd.hd_hash >= 41 and hd.hd_hash <= 441
;
