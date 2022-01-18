select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 547 and ss.ss_hash <= 880 and hd.hd_hash >= 32 and hd.hd_hash <= 432 and d.d_hash >= 230 and d.d_hash <= 980
;
