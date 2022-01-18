select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 799 and ss.ss_hash <= 899 and cd.cd_hash >= 408 and cd.cd_hash <= 458 and d.d_hash >= 270 and d.d_hash <= 290
;
