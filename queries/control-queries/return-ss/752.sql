select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and hd.hd_hash >= 539 and hd.hd_hash <= 939 and cd.cd_hash >= 428 and cd.cd_hash <= 761 and d.d_hash >= 146 and d.d_hash <= 896
;
