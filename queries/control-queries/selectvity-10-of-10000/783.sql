select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 808 and cd.cd_hash <= 908 and hd.hd_hash >= 45 and hd.hd_hash <= 245 and d.d_hash >= 808 and d.d_hash <= 858
;
