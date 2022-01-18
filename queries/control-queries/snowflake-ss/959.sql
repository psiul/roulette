select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,household_demographics hd,date_dim d
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 151 and ss.ss_hash <= 551 and cd.cd_hash >= 256 and cd.cd_hash <= 589 and d.d_hash >= 89 and d.d_hash <= 839
;
