select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 335 and ss.ss_hash <= 668 and cd.cd_hash >= 151 and cd.cd_hash <= 901 and hd.hd_hash >= 246 and hd.hd_hash <= 646
;
