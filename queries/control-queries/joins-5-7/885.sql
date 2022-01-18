select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 188 and ss.ss_hash <= 588 and cd.cd_hash >= 141 and cd.cd_hash <= 891 and i.i_hash >= 41 and i.i_hash <= 374
;
