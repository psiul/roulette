select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,date_dim d,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 385 and cd.cd_hash <= 785 and hd.hd_hash >= 54 and hd.hd_hash <= 804 and i.i_hash >= 127 and i.i_hash <= 460
;
