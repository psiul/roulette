select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 196 and hd.hd_hash <= 246 and d.d_hash >= 644 and d.d_hash <= 664 and cd.cd_hash >= 372 and cd.cd_hash <= 472
;
