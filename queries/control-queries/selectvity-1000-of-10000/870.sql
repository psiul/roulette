select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 122 and ss.ss_hash <= 522 and cd.cd_hash >= 66 and cd.cd_hash <= 816 and d.d_hash >= 480 and d.d_hash <= 813
;
