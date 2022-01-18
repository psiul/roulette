select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 135 and ss.ss_hash <= 885 and i.i_hash >= 350 and i.i_hash <= 750 and cd.cd_hash >= 373 and cd.cd_hash <= 706
;
