select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 225 and ss.ss_hash <= 975 and hd.hd_hash >= 50 and hd.hd_hash <= 383 and d.d_hash >= 18 and d.d_hash <= 418
;
