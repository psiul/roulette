select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,date_dim d,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 339 and i.i_hash <= 739 and cd.cd_hash >= 114 and cd.cd_hash <= 864 and hd.hd_hash >= 334 and hd.hd_hash <= 667
;
