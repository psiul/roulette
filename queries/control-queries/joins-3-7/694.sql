select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 532 and ss.ss_hash <= 865 and hd.hd_hash >= 11 and hd.hd_hash <= 761 and d.d_hash >= 276 and d.d_hash <= 676
;
