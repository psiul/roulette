select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 248 and ss.ss_hash <= 748 and i.i_hash >= 436 and i.i_hash <= 636 and cd.cd_hash >= 258 and cd.cd_hash <= 358
;