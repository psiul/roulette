select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 17 and ss.ss_hash <= 417 and hd.hd_hash >= 633 and hd.hd_hash <= 966 and d.d_hash >= 0 and d.d_hash <= 750
;
