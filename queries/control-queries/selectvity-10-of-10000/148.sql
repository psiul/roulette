select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,customer_demographics cd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 141 and i.i_hash <= 241 and hd.hd_hash >= 932 and hd.hd_hash <= 982 and cd.cd_hash >= 653 and cd.cd_hash <= 853
;
