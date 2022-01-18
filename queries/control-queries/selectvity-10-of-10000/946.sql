select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 288 and cd.cd_hash <= 338 and i.i_hash >= 551 and i.i_hash <= 751 and hd.hd_hash >= 664 and hd.hd_hash <= 764
;
