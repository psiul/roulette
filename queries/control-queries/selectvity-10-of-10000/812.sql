select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 173 and ss.ss_hash <= 373 and cd.cd_hash >= 597 and cd.cd_hash <= 697 and i.i_hash >= 422 and i.i_hash <= 472
;
