select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 143 and i.i_hash <= 893 and hd.hd_hash >= 339 and hd.hd_hash <= 672 and cd.cd_hash >= 434 and cd.cd_hash <= 834
;
