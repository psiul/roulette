select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 794 and ss.ss_hash <= 994 and cd.cd_hash >= 455 and cd.cd_hash <= 555 and d.d_hash >= 837 and d.d_hash <= 887
;
