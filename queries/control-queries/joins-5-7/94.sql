select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer_demographics cd,household_demographics hd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 149 and d.d_hash <= 899 and cd.cd_hash >= 68 and cd.cd_hash <= 468 and i.i_hash >= 491 and i.i_hash <= 824
;
