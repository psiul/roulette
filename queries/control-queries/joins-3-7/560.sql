select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 159 and ss.ss_hash <= 492 and hd.hd_hash >= 597 and hd.hd_hash <= 997 and d.d_hash >= 232 and d.d_hash <= 982
;
