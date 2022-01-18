select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and cd.cd_hash >= 573 and cd.cd_hash <= 773 and hd.hd_hash >= 452 and hd.hd_hash <= 502 and d.d_hash >= 743 and d.d_hash <= 843
;
