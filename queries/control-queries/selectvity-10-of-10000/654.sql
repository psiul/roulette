select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 381 and cd.cd_hash <= 481 and hd.hd_hash >= 376 and hd.hd_hash <= 576 and i.i_hash >= 49 and i.i_hash <= 99
;
