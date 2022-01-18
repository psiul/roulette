select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 475 and ss.ss_hash <= 875 and hd.hd_hash >= 485 and hd.hd_hash <= 818 and d.d_hash >= 22 and d.d_hash <= 772
;
