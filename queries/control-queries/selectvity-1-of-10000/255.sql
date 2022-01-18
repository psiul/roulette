select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 68 and i.i_hash <= 88 and cd.cd_hash >= 311 and cd.cd_hash <= 361 and hd.hd_hash >= 260 and hd.hd_hash <= 360
;
