select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 155 and cd.cd_hash <= 488 and d.d_hash >= 37 and d.d_hash <= 787 and i.i_hash >= 383 and i.i_hash <= 783
;