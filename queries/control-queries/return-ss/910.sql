select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 9 and ss.ss_hash <= 759 and cd.cd_hash >= 348 and cd.cd_hash <= 681 and d.d_hash >= 243 and d.d_hash <= 643
;
