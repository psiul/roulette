select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,customer_demographics cd,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 345 and hd.hd_hash <= 845 and i.i_hash >= 320 and i.i_hash <= 420 and cd.cd_hash >= 768 and cd.cd_hash <= 968
;
