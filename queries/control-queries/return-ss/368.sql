select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,item i,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 480 and d.d_hash <= 813 and i.i_hash >= 559 and i.i_hash <= 959 and cd.cd_hash >= 151 and cd.cd_hash <= 901
;
