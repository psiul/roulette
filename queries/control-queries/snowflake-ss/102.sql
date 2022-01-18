select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 217 and ss.ss_hash <= 967 and cd.cd_hash >= 435 and cd.cd_hash <= 768 and hd.hd_hash >= 336 and hd.hd_hash <= 736
;
