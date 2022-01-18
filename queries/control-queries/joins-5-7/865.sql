select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 483 and d.d_hash <= 883 and i.i_hash >= 74 and i.i_hash <= 824 and cd.cd_hash >= 245 and cd.cd_hash <= 578
;
