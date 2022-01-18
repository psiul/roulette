select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,date_dim d,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 269 and ss.ss_hash <= 769 and cd.cd_hash >= 602 and cd.cd_hash <= 802 and d.d_hash >= 599 and d.d_hash <= 699
;
