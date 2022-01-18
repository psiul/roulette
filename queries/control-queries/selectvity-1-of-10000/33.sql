select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 432 and ss.ss_hash <= 452 and cd.cd_hash >= 113 and cd.cd_hash <= 163 and hd.hd_hash >= 510 and hd.hd_hash <= 610
;
