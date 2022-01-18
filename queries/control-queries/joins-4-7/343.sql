select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 662 and ss.ss_hash <= 995 and d.d_hash >= 364 and d.d_hash <= 764 and hd.hd_hash >= 6 and hd.hd_hash <= 756
;
