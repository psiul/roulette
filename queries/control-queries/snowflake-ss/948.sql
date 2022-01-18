select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 55 and ss.ss_hash <= 388 and cd.cd_hash >= 397 and cd.cd_hash <= 797 and hd.hd_hash >= 63 and hd.hd_hash <= 813
;