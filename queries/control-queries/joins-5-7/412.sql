select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 450 and ss.ss_hash <= 783 and cd.cd_hash >= 542 and cd.cd_hash <= 942 and hd.hd_hash >= 248 and hd.hd_hash <= 998
;
