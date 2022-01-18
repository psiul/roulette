select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 198 and ss.ss_hash <= 531 and cd.cd_hash >= 176 and cd.cd_hash <= 926 and d.d_hash >= 527 and d.d_hash <= 927
;
