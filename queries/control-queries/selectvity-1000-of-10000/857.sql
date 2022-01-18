select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 65 and d.d_hash <= 815 and cd.cd_hash >= 411 and cd.cd_hash <= 811 and hd.hd_hash >= 17 and hd.hd_hash <= 350
;
