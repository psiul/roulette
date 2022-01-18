select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 898 and i.i_hash <= 998 and d.d_hash >= 374 and d.d_hash <= 424 and cd.cd_hash >= 303 and cd.cd_hash <= 323
;
