select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer_demographics cd,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 196 and ss.ss_hash <= 529 and hd.hd_hash >= 554 and hd.hd_hash <= 954 and cd.cd_hash >= 44 and cd.cd_hash <= 794
;
