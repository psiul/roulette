select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 710 and hd.hd_hash <= 810 and cd.cd_hash >= 374 and cd.cd_hash <= 574 and d.d_hash >= 642 and d.d_hash <= 692
;
