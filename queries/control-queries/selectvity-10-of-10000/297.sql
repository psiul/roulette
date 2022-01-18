select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 3 and hd.hd_hash <= 103 and cd.cd_hash >= 524 and cd.cd_hash <= 724 and i.i_hash >= 519 and i.i_hash <= 569
;
