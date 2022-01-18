select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 481 and ss.ss_hash <= 881 and cd.cd_hash >= 154 and cd.cd_hash <= 904 and d.d_hash >= 219 and d.d_hash <= 552
;
