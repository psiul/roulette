select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 110 and ss.ss_hash <= 610 and cd.cd_hash >= 387 and cd.cd_hash <= 487 and hd.hd_hash >= 200 and hd.hd_hash <= 400
;
