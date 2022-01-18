select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 363 and d.d_hash <= 863 and i.i_hash >= 227 and i.i_hash <= 427 and cd.cd_hash >= 44 and cd.cd_hash <= 144
;
