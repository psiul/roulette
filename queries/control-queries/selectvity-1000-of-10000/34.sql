select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 207 and ss.ss_hash <= 957 and cd.cd_hash >= 211 and cd.cd_hash <= 544 and i.i_hash >= 155 and i.i_hash <= 555
;
