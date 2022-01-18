select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 204 and i.i_hash <= 537 and d.d_hash >= 273 and d.d_hash <= 673 and cd.cd_hash >= 241 and cd.cd_hash <= 991
;
