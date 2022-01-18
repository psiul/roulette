select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,item i,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 243 and ss.ss_hash <= 993 and cd.cd_hash >= 490 and cd.cd_hash <= 823 and d.d_hash >= 379 and d.d_hash <= 779
;
