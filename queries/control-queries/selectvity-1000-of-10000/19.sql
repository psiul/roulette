select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 81 and cd.cd_hash <= 831 and d.d_hash >= 519 and d.d_hash <= 919 and hd.hd_hash >= 170 and hd.hd_hash <= 503
;
