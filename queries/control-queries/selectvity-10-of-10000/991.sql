select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 63 and d.d_hash <= 163 and cd.cd_hash >= 432 and cd.cd_hash <= 482 and i.i_hash >= 510 and i.i_hash <= 710
;
