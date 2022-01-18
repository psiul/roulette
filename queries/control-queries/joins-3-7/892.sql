select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 389 and ss.ss_hash <= 789 and hd.hd_hash >= 182 and hd.hd_hash <= 932 and d.d_hash >= 649 and d.d_hash <= 982
;
