select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 112 and ss.ss_hash <= 212 and hd.hd_hash >= 119 and hd.hd_hash <= 319 and cd.cd_hash >= 364 and cd.cd_hash <= 864
;
