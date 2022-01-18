select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 154 and ss.ss_hash <= 904 and cd.cd_hash >= 0 and cd.cd_hash <= 400 and i.i_hash >= 298 and i.i_hash <= 631
;