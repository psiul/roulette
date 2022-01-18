select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,date_dim d,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and hd.hd_hash >= 65 and hd.hd_hash <= 815 and i.i_hash >= 503 and i.i_hash <= 903 and cd.cd_hash >= 163 and cd.cd_hash <= 496
;
