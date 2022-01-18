select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 382 and ss.ss_hash <= 432 and cd.cd_hash >= 592 and cd.cd_hash <= 692 and i.i_hash >= 105 and i.i_hash <= 305
;
