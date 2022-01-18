select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 177 and ss.ss_hash <= 277 and d.d_hash >= 879 and d.d_hash <= 929 and cd.cd_hash >= 183 and cd.cd_hash <= 203
;
