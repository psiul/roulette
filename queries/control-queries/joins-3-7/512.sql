select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 218 and ss.ss_hash <= 551 and d.d_hash >= 94 and d.d_hash <= 844 and hd.hd_hash >= 396 and hd.hd_hash <= 796
;
