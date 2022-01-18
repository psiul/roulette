select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 285 and cd.cd_hash <= 685 and i.i_hash >= 53 and i.i_hash <= 803 and d.d_hash >= 535 and d.d_hash <= 868
;
