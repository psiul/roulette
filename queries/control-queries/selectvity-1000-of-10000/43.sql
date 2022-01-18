select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,date_dim d,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 282 and ss.ss_hash <= 615 and cd.cd_hash >= 60 and cd.cd_hash <= 810 and i.i_hash >= 205 and i.i_hash <= 605
;
