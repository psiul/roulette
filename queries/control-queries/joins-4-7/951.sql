select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 68 and ss.ss_hash <= 468 and hd.hd_hash >= 118 and hd.hd_hash <= 868 and d.d_hash >= 511 and d.d_hash <= 844
;
