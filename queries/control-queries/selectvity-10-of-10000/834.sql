select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,date_dim d,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 145 and i.i_hash <= 345 and hd.hd_hash >= 104 and hd.hd_hash <= 154 and cd.cd_hash >= 753 and cd.cd_hash <= 853
;
