select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 82 and ss.ss_hash <= 415 and cd.cd_hash >= 5 and cd.cd_hash <= 755 and i.i_hash >= 290 and i.i_hash <= 690
;
