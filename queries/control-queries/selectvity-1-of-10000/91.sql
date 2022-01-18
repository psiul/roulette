select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 601 and ss.ss_hash <= 701 and d.d_hash >= 860 and d.d_hash <= 880 and cd.cd_hash >= 134 and cd.cd_hash <= 184
;
