select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 421 and d.d_hash <= 621 and hd.hd_hash >= 850 and hd.hd_hash <= 900 and cd.cd_hash >= 563 and cd.cd_hash <= 663
;
