select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,date_dim d,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 228 and ss.ss_hash <= 978 and cd.cd_hash >= 158 and cd.cd_hash <= 558 and i.i_hash >= 4 and i.i_hash <= 337
;
