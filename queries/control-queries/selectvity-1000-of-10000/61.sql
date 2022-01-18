select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,customer_demographics cd,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 570 and i.i_hash <= 970 and cd.cd_hash >= 395 and cd.cd_hash <= 728 and hd.hd_hash >= 224 and hd.hd_hash <= 974
;
