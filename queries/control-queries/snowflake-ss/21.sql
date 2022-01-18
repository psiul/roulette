select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 104 and i.i_hash <= 854 and hd.hd_hash >= 166 and hd.hd_hash <= 499 and cd.cd_hash >= 189 and cd.cd_hash <= 589
;
