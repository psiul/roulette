select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 662 and i.i_hash <= 712 and cd.cd_hash >= 441 and cd.cd_hash <= 641 and hd.hd_hash >= 411 and hd.hd_hash <= 511
;
